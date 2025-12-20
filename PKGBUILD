# Maintainer: Momin Khan <yokai1923@gmail.com>
pkgname=opsec
pkgver=1.0.0
pkgrel=1
pkgdesc="Privacy and security toolkit with Cloudflare WARP VPN integration, Java malware scanner, password fortifier, and metadata anonymizer"
arch=('x86_64')
url="https://github.com/yokai123debug/opsec"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
    'python-pyqt5-webengine'
    'python-pywebview'
    'python-pillow'
    'python-requests'
    'qt5-webengine'
)
optdepends=(
    'cloudflare-warp-bin: Required for WARP VPN feature'
)
makedepends=(
    'python-pyinstaller'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    pyinstaller --onefile --noconsole --name "opsec" \
        --add-data "index.html:." \
        --add-data "style.css:." \
        --add-data "app.js:." \
        --add-data "opsec.svg:." \
        main.py
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    install -Dm755 "dist/opsec" "${pkgdir}/usr/bin/opsec"
    install -Dm644 "opsec.desktop" "${pkgdir}/usr/share/applications/opsec.desktop"
    install -Dm644 "opsec.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/opsec.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
