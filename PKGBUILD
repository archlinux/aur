# Maintainer: KevinCrrl

pkgname=clangd-bin
pkgver=20.1.8
pkgrel=1
pkgdesc='clangd language server'
arch=('any')

# URL del proyecto oficial de clangd
url="https://github.com/clangd/clangd"

# Licencia de clangd
license=('Apache-2.0')

depends=()

# Compiladores opcionales
optdepends=('clang' 'gcc')

conflicts=('clangd')
provides=('clangd')

options=('!debug')

source=("${url}/releases/download/${pkgver}/clangd-linux-${pkgver}.zip")
sha256sums=('98493005e2c7532e69827987d909c46295e2ee997a48228606e7777547994490')

package() {
    mkdir -p "$pkgdir/opt/clangd"
    mkdir -p "$pkgdir/usr/bin"

    cd "${srcdir}/clangd_${pkgver}" || exit 1

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/opt/clangd/clangd"

    ln -s /opt/clangd/clangd "$pkgdir/usr/bin/clangd"
}
