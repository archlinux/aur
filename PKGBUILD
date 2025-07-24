# Maintainer: SelectionRemark

pkgname=beancount-language-server
pkgver=1.4.1
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=(https://github.com/polarmutex/${pkgname}/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('e8b13cd62c91a346c2996b256ab8e3b30c68290217673241055ed4df872560f30ac201f55274487e724046ca79e57f4f5ebf7c4498f3465cfe88887c27f204e7')

# needed for rust packages, cargo compilation fails. See
# https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20#note_172172
options=(!debug !lto)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
