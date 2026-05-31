# Maintainer: SelectionRemark

pkgname=beancount-language-server
pkgver=1.9.2
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/${pkgname}"
license=('MIT')
depends=('beancount')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('29bf23c20d7b467fa0112309a76e39a5bc0e926922e643d17891f0570314397d3a66b1f9b5d1678f5d32e11545a88caa7b85e2f49f9b179f0de259fbc37bde67')

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
