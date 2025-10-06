# Maintainer: Miles Schulte <milesdschulte@gmail.com>

pkgname=pixelpad
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform scratchpad built with PySide6"
arch=('x86_64')
url="https://github.com/neb-ms/pixelPad"
license=('MIT')
depends=('python' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("pixelPad-${pkgver}.tar.gz::https://github.com/neb-ms/pixelPad/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('565dae3d8e778661d3b99948c0e9c8bd183abe8f97622431bde68681fff3c0d9')

prepare() {
    cd "${srcdir}/pixelPad-${pkgver}"
    # Normalize line endings if necessary, ensure scripts are executable
    find . -type f -name '*.py' -exec chmod 644 {} +
}

package() {
    cd "${srcdir}/pixelPad-${pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r main.py pixelpad pics fonts "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOW'
#!/bin/sh
exec /usr/bin/python /usr/lib/pixelpad/main.py "$@"
EOW

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
