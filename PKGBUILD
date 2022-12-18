# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>

pkgname=pleroma-bin
pkgver=2.4.5
pkgrel=2
pkgdesc='A microblogging server software that can federate (= exchange messages with) other servers that support ActivityPub.'
url='https://pleroma.social/'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(x86_64 aarch64 armv7h)
depends=(ncurses file libxcrypt-compat openssl-1.1)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
provides=(pleroma)
conflicts=(pleroma)
backup=('etc/pleroma/config.exs')
install=pleroma.install
source_x86_64=("pleroma-x86_64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/220705/artifacts/download")
source_aarch64=("pleroma-aarch64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/220709/artifacts/download")
source_armv7h=("pleroma-armv7h-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/220707/artifacts/download")
source=('pleroma.sysusers'
        'pleroma.tmpfiles'
        'pleroma.service'
        'COPYING')
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b5e844fab22dc4fafdec09c1f14437a06d3a12fae753fc0be968d22eaddfd6dc'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
            'e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104')
sha256sums_x86_64=('8b4e2ab17362c7b0ed3ca685e19d578ad842ac00cde2db7d8c54dfd5a4e05891')
sha256sums_aarch64=('e432310df95ae4d915a02082252df0346ca7e112ffa4484b6a05075778c71338')
sha256sums_armv7h=('c31dd8bb62728887cfe5488ef5818dc5e57e90f6443fbcfd501ea12044d0a94c')

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
