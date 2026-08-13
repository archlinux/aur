# Maintainer: gigas002 <gigas002@pm.me>

pkgname="waysip"
pkgver=0.7.0
pkgrel=1
pkgdesc="A wayland-native, blazing-fast area selection tool"
arch=('x86_64')
url="https://github.com/waycrate/waysip"
license=('MIT')
depends=(wayland pango cairo glib2)
makedepends=(cargo)
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b63637ef5aea217096974a84181575ed15452ee0a157da83aa103cc4a488a9b725d3876cfabfe342f7ea7f426dc5576bf3b1b6d1cf8dbc9bd9c396c21fc2e788')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
