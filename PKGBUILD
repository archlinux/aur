# Maintainer: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>

pkgname=pleroma-bin
pkgver=2.4.2
pkgrel=1
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
source_x86_64=("pleroma-x86_64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/202882/artifacts/download?file_type=archive")
source_aarch64=("pleroma-aarch64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/202886/artifacts/download?file_type=archive")
source_armv7h=("pleroma-armv7h-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/202884/artifacts/download?file_type=archive")
source=('pleroma.sysusers'
        'pleroma.tmpfiles'
        'pleroma.service'
        'COPYING')
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b5e844fab22dc4fafdec09c1f14437a06d3a12fae753fc0be968d22eaddfd6dc'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
            'e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104')
sha256sums_x86_64=('0ba949e50129323356cc464ff95f9d8acb19e0efd892a57ac63ecdf3f890248a')
sha256sums_aarch64=('77a717f150b7dad2f78c480ac905439d5b2148ad7c86ea49ac5cd0758d9877c2')
sha256sums_armv7h=('9f4374b2200d5848f122f6514362a8b1e49ef712aa97db0f40e416b5cf7b8909')

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
