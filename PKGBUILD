# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# based on pleroma-bin PKGBUILD
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>

pkgname=akkoma-bin
pkgver=2023.05
pkgrel=1
pkgdesc='a smallish microblogging platform, aka the cooler pleroma'
url='https://akkoma.social'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(x86_64)
depends=(ncurses file libxcrypt-compat openssl-1.1)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
provides=(akkoma)
conflicts=(akkoma)
backup=('etc/akkoma/config.exs')
install=akkoma.install
source_x86_64=("akkoma-amd64-${pkgver}.zip::https://akkoma-updates.s3-website.fr-par.scw.cloud/stable/akkoma-amd64.zip")
source=('akkoma.sysusers'
        'akkoma.tmpfiles'
        'akkoma.service'
        'COPYING')
sha256sums=('0247ee5cc24049ebc37a00634aad8ed9a44d0f9a399a1373284375f5c861a089'
            '20715a673d70c3eafc160de98a325d1f253abc1dc89ff280d121c95ba5e9bb81'
            '44181109808ca6ff3e856c0b9800978f9c9dc28b6d98ac71862c06ed354f98e2'
            '1da9737d28754b51adae10a6391c8e83c40fe052dc4b04438a1dd0587a5c9a41')
sha256sums_x86_64=('53acaecf82283d724c7c64b403b8130d22cbe050f6c224f55f73a158da2c52fe')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/opt/akkoma"
    find release -executable -exec chmod a+rx {} \;
    cp -r release/* "${pkgdir}/opt/akkoma"
    install -Dm 644 akkoma.sysusers "${pkgdir}/usr/lib/sysusers.d/akkoma.conf"
    install -Dm 644 akkoma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/akkoma.conf"
    install -Dm 644 akkoma.service "${pkgdir}/usr/lib/systemd/system/akkoma.service"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
