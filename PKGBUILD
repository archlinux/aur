# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# based on pleroma-bin PKGBUILD
# Contributor: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>

pkgname=akkoma-bin
pkgver=2023.08
pkgrel=2
pkgdesc='a smallish microblogging platform, aka the cooler pleroma'
url='https://akkoma.social'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(x86_64 aarch64)
depends=(ncurses file libxcrypt-compat)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
provides=(akkoma)
conflicts=(akkoma)
backup=('etc/akkoma/config.exs')
install=akkoma.install
source_x86_64=("akkoma-amd64-${pkgver}.zip::https://akkoma-updates.s3-website.fr-par.scw.cloud/stable/akkoma-amd64.zip")
source_aarch64=("akkoma-arm64-${pkgver}.zip::https://akkoma-updates.s3-website.fr-par.scw.cloud/stable/akkoma-arm64.zip")
source=('akkoma.sysusers'
        'akkoma.tmpfiles'
        'akkoma.service'
        'COPYING')
sha256sums=('0247ee5cc24049ebc37a00634aad8ed9a44d0f9a399a1373284375f5c861a089'
            '20715a673d70c3eafc160de98a325d1f253abc1dc89ff280d121c95ba5e9bb81'
            '83a90cf08dbe715a5c28545c85faba6fe9a76e0808ce8aa0aa7b54b718e35beb'
            '1da9737d28754b51adae10a6391c8e83c40fe052dc4b04438a1dd0587a5c9a41')
sha256sums_x86_64=('105b6f928df70e58beeb804144eae1c81dbf08718b2ba41de828bc7554a6e6aa')
sha256sums_aarch64=('7caa8dbafb39c15210976acc90257da560452e9fe28493994f37fbffcb45a7c8')



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
