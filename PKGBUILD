pkgname=legacyfox
pkgver=latest
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL')
depends=('firefox')
makedepends=('git')
source=("git+https://github.com/girst/legacyfox")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/lib/firefox"
  make mozilladir="$pkgdir/usr/lib/firefox" install
}
