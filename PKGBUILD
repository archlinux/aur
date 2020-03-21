pkgname=sflock-git
pkgver=r27.ded0d82
pkgrel=1
pkgdesc="A simple screen locker for X"
arch=('i686' 'x86_64')
url="https://github.com/benruijl/sflock"
license=('MIT')
optdepends=('ttf-dejavu: this is the default font')
depends=('libxext')
makedepends=('git')
source=('git+https://github.com/benruijl/sflock.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sflock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sflock"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/sflock"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
