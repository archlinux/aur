# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex
pkgver=0.1.0
pkgrel=1
pkgdesc="On-demand LaTeX: a portable TeX kernel that installs CTAN packages only when a document needs them"
arch=('x86_64')
url="https://github.com/Huseynteymurzade28/pomtex"
license=('MIT')
depends=('gc' 'pcre2' 'openssl' 'zlib' 'xz')
makedepends=('crystal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da32699195558d7745b8f4ab155cdc4d36578d91166a0d494f91385e91624b8e')

build() {
  cd "$pkgname-$pkgver"
  crystal build src/pomtex.cr -o pomtex --release --no-debug
}

check() {
  cd "$pkgname-$pkgver"
  crystal spec
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 pomtex "$pkgdir/usr/bin/pomtex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
}
