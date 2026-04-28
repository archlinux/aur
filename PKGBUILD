# Maintainer: jcearnal

pkgname=kwin-scripts-magnetile
pkgver=0.2.0
pkgrel=1
pkgdesc="KWin script for snapping windows into zones with connected tile resizing"
arch=('any')
url="https://github.com/jcearnal/magnetile"
license=('GPL-3.0-only')
depends=('kwin>=6.4')
makedepends=('kpackage' 'make' 'zip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jcearnal/magnetile/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31f19161bb539a5fdb4a17f7b48b4267b2fb03e75680844e57e1a98a7309b9cc')

build() {
    cd "magnetile-${pkgver}"
    make build
}

package() {
    cd "magnetile-${pkgver}"

    kpackagetool6 \
        --type=KWin/Script \
        --packageroot="${pkgdir}/usr/share/kwin/scripts" \
        --install magnetile.kwinscript

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 NOTICE.md "${pkgdir}/usr/share/doc/${pkgname}/NOTICE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
