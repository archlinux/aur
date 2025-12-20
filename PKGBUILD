# Maintainer: Momin Khan <yokai1923@gmail.com>
pkgname=opsec
pkgver=1.1.0
pkgrel=1
pkgdesc="Privacy and security toolkit with Cloudflare WARP VPN, Java malware scanner, session checker, and password fortifier for Minecraft client users"
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
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install application files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"
    install -Dm644 backend.py "${pkgdir}/usr/lib/${pkgname}/backend.py"
    install -Dm644 index.html "${pkgdir}/usr/lib/${pkgname}/index.html"
    install -Dm644 style.css "${pkgdir}/usr/lib/${pkgname}/style.css"
    install -Dm644 app.js "${pkgdir}/usr/lib/${pkgname}/app.js"
    install -Dm644 opsec.svg "${pkgdir}/usr/lib/${pkgname}/opsec.svg"
    
    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/opsec" << 'EOF'
#!/bin/bash
cd /usr/lib/opsec
exec python main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/opsec"
    
    # Install desktop file, icon, license, docs
    install -Dm644 "opsec.desktop" "${pkgdir}/usr/share/applications/opsec.desktop"
    install -Dm644 "opsec.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/opsec.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
