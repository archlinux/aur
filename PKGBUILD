_pkgname=verne
_srcname=jesus
pkgname=$_pkgname-git
pkgver=r717.38a0424
pkgrel=1
pkgdesc="A filemanager build with EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git')
makedepends=('git' 'cmake' 'check')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_srcname" "${_srcname}-git")
source=("git+https://git.enlightenment.org/devs/bu5hm4n/${_srcname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_srcname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_srcname"

  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr/ -DCMAKE_INSTALL_LIBDIR=/usr/lib

  make
}

package() {
  cd "$srcdir/$_srcname"

  make DESTDIR="$pkgdir" install

  # install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

