# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=grubforge
pkgver=0.9.0
pkgrel=1
pkgdesc="A terminal UI for managing and customizing the GRUB bootloader — safely, intuitively, and beautifully"
arch=('any')
url="https://github.com/jetomev/grubforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jetomev/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8a6c2392a2712b1f5e7304311c994376559202d14d6eb370318613583bf8404')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the Python package
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r grubforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    # Install the launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python /usr/lib/grubforge/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install the man page
    install -Dm644 grubforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}