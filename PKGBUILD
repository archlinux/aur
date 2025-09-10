# Maintainer: KevinCrrl

pkgname=clangd-bin
pkgver=21.1.0
pkgrel=1
pkgdesc='Clangd Language Server and headers'
arch=('x86_64')

# URL del proyecto oficial de clangd
url="https://github.com/clangd/clangd"

# Licencia de clangd
license=('Apache-2.0 with LLVM Exceptions')

depends=('rsync')

optdepends=('gcc: Compiler without conflicts with clangd')

conflicts=('clangd' 'clang')
provides=('clangd')

options=('!debug')

source=("${url}/releases/download/${pkgver}/clangd-linux-${pkgver}.zip")
sha256sums=('d9a2e8dd5dfbb68d892c2b51f3a735b526148fef89141ffea6ee7ff8637fd1a6')

package() {
    cd "${srcdir}/clangd_${pkgver}" || exit 1

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 bin/clangd "$pkgdir/usr/bin/clangd"

    dest="$pkgdir/usr/local/lib/clang/21"
    mkdir -p "$dest"

    # Copiar todo el contenido de include directamente a la ruta final
    rsync -a lib/clang/21/include/ "$dest/"

}
