pkgname=('alfis')
pkgver=0.8.4
pkgrel=1
pkgdesc='Alternative Free Identity System using blockchain'
arch=('x86_64')
url='https://github.com/Revertron/Alfis'
license=('AGPL3')
depends=('webkit2gtk' 'gtk3')
makedepends=('cargo' 'rust' 'atk' 'pango')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Revertron/Alfis/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6ad6b8e17e6e2efc70805a0a46ff56f502e1bd605c32e0dfcdb454b3690a958c')

_dirname="Alfis-${pkgver}"

build() {
    cd ${_dirname}
    cargo build --release --all-features
}

package() {
    cd ${_dirname}
    cargo install --locked --root "${pkgdir}"/usr --path "${srcdir}"/${_dirname} --all-features
    rm "${pkgdir}"/usr/{.crates.toml,.crates2.json}

    install -Dm644 "${srcdir}"/${_dirname}/contrib/systemd/alfis.service "${pkgdir}"/usr/lib/systemd/system/alfis.service
    install -Dm644 "${srcdir}"/${_dirname}/contrib/systemd/alfis.sysusers "${pkgdir}"/usr/lib/sysusers.d/alfis.conf
    install -Dm644 "${srcdir}"/${_dirname}/contrib/systemd/alfis.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/alfis.conf
    install -Dm644 "${srcdir}"/${_dirname}/contrib/name.alfis.Alfis.desktop "${pkgdir}"/usr/share/applications/name.alfis.Alfis.desktop
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon22.png "${pkgdir}"/usr/share/icons/hicolor/22x22/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon24.png "${pkgdir}"/usr/share/icons/hicolor/24x24/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon36.png "${pkgdir}"/usr/share/icons/hicolor/36x36/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon72.png "${pkgdir}"/usr/share/icons/hicolor/72x72/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon96.png "${pkgdir}"/usr/share/icons/hicolor/96x96/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon192.png "${pkgdir}"/usr/share/icons/hicolor/192x192/apps/alfis.png
    install -Dm644 "${srcdir}"/${_dirname}/img/logo/alfis_icon256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/alfis.png
}
