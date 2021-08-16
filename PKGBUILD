# Maintainer: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>

pkgname=pleroma-bin
pkgver=2.4.0
pkgrel=2
pkgdesc='A microblogging server software that can federate (= exchange messages with) other servers that support ActivityPub.'
url='https://pleroma.social/'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(x86_64 aarch64 armv7h)
depends=(ncurses file)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
provides=(pleroma)
conflicts=(pleroma)
backup=('etc/pleroma/config.exs')
install=pleroma.install
source_x86_64=("pleroma-x86_64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/193204/artifacts/download?file_type=archive")
source_aarch64=("pleroma-aarch64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/193208/artifacts/download?file_type=archive")
source_armv7h=("pleroma-armv7h-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/193206/artifacts/download?file_type=archive")
source=('pleroma.sysusers'
        'pleroma.tmpfiles'
        'pleroma.service'
        'COPYING')
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b5e844fab22dc4fafdec09c1f14437a06d3a12fae753fc0be968d22eaddfd6dc'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
            'e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104')
sha256sums_x86_64=('335857f4568c3fa911b7a9a1d5340b0e9ea7fde32f18af2a0cf645081ec0a5df')
sha256sums_aarch64=('dc3fa4552d43606cc998c9e63963c3c258f15fed002db3aa3f122b9ec378db56')
sha256sums_armv7h=('a757c6a60ad4f11e354323c44f8f576bd5c8219ca4ca99cbd8a5b5706237731f')

package() {
	cd "$srcdir"

	mkdir -p "${pkgdir}/opt/pleroma"
    find release -executable -exec chmod a+rx {} \;
	cp -r release/* "${pkgdir}/opt/pleroma"
	install -Dm 644 pleroma.sysusers "${pkgdir}/usr/lib/sysusers.d/pleroma.conf"
	install -Dm 644 pleroma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pleroma.conf"
    install -Dm 644 pleroma.service "${pkgdir}/usr/lib/systemd/system/pleroma.service"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
