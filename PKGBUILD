# Maintainer: SelectionRemark

pkgname=beancount-language-server
pkgver=1.5.0
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('85eb517c55ad2c2720d48a9c13740dc45fcba58290d535184ad4e86c74b4e50ef61d2fe3a403b5a766098405cc6a21c1a6e0174c2c2b62d4dc9ff269a64a4011')

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
