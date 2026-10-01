# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex
pkgver=0.1.1
pkgrel=1
pkgdesc="On-demand LaTeX: a portable TeX kernel that installs CTAN packages only when a document needs them"
arch=('x86_64')
url="https://github.com/Huseynteymurzade28/pomtex"
license=('MIT')
depends=('gc' 'pcre2' 'openssl' 'zlib' 'xz')
makedepends=('crystal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c6c537f9245e5abe3669ba8cc8f753231964ca7b0d0d8905a30557d305da1f14')

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
