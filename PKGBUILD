# Maintainer: danso <dev-aur@danso.ca>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>

pkgname=pleroma-bin
pkgver=2.5.0
pkgrel=2
pkgdesc='A microblogging server software that can federate (= exchange messages with) other servers that support ActivityPub.'
url='https://pleroma.social/'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(x86_64 aarch64 armv7h)
depends=(ncurses file libxcrypt-compat openssl-1.1)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filter.Exiftool.StripLocation'
            'nginx: http server')
provides=(pleroma)
conflicts=(pleroma)
backup=('etc/pleroma/config.exs')
install=pleroma.install
# sources from https://git.pleroma.social/pleroma/pleroma/-/pipelines/43177/
# job name "amd64"
source_x86_64=("pleroma-x86_64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/226602/artifacts/download")
# job name "arm64"
source_aarch64=("pleroma-aarch64-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/226606/artifacts/download")
# job name "arm"
source_armv7h=("pleroma-armv7h-${pkgver}.zip::https://git.pleroma.social/pleroma/pleroma/-/jobs/226604/artifacts/download")
source=('pleroma.sysusers'
        'pleroma.tmpfiles'
        'pleroma.service'
        'COPYING')
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b5e844fab22dc4fafdec09c1f14437a06d3a12fae753fc0be968d22eaddfd6dc'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
            'e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104')
sha256sums_x86_64=('0a8a64ee9642349976ec83be3649d607115b3819a99f7d056135fbe3a5d58480')
sha256sums_aarch64=('9b7092566d2279c0911d86f8641a2a08aef67d5f76563939459e6c1fb1144279')
sha256sums_armv7h=('90ca77fd63ebe849659864e95af194bb8b7d268f9e5aa13756c4d6a07257a692')

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
