# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=catlooking-git
pkgver=20130526
pkgrel=1
pkgdesc="A text writer with clear and simple interface allowing you to concentrate on your text"
arch=('i686' 'x86_64')
url="http://catlooking.com/"
license=('GPL3')
depends=('qt4')
makedepends=('git')
provides=('catlooking')
conflicts=('catlooking')
source=('git://github.com/sychev/catlooking.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/catlooking"
  git log -1 --format="%cd" --date=short | tr -d -
}

build() {
  cd "$srcdir/catlooking"
  qmake-qt4
  make
}

package() {
  cat "$srcdir/catlooking/debian/install" | sed -e 's/^\(.*\)\/\([^\/]*\) \(.*\)$/install -Dm0644 "$srcdir\/catlooking\/\1\/\2" "$pkgdir\/\3\/\2"/g' | srcdir="$srcdir" pkgdir="$pkgdir" sh
  chmod 755 "$pkgdir/usr/bin/catlooking"
}
