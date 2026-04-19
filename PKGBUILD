# Maintainer: gigas002 <gigas002@pm.me>

pkgname="waysip"
pkgver=0.6.1
pkgrel=1
pkgdesc="A wayland-native, blazing-fast area selection tool"
arch=('x86_64')
url="https://github.com/waycrate/waysip"
license=('MIT')
depends=(wayland pango cairo glib2)
makedepends=(cargo)
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a245d32b03ad7bc5dda40950d9d7762f36a8f8582ed266505c0b1c7cb59be981fcfa0b2f1cb46e0dabb092ea56d53301b295368420f74ed41330dc73978436f9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
