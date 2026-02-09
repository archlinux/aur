# Maintainer: SelectionRemark

pkgname=beancount-language-server
pkgver=1.9.1
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3ceb8c5c789334838959a11105fd86a51444ccbf8e93fc80154ff4fc85a2dd0fe4ac8391bf636dc708299fe00c76d5c4bdff32d2089335a89108149045c99349')

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
