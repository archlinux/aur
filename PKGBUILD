pkgname=szsol-git
pkgver=r37.5b4c757
pkgrel=1
pkgdesc="ncurses clone of Shenzhen Solitaire card game"
arch=('any')
url="https://github.com/usrshare/szsol"
license=('MIT')
makedepends=('git' 'ncurses')
source=('git+https://github.com/usrshare/szsol')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/szsol"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/szsol"
  sed -i 's/ncursesw5-config/ncursesw6-config/' Makefile
  make
}

package() {
  # cd "$srcdir/szsol"
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/szsol/szsol" "$pkgdir/usr/bin"
  install -Dm644 $srcdir/szsol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
