# Maintainer: Daniel Haß <aur@hass.onl>
_pkgname=jesus
pkgname=$_pkgname-git
pkgver=544.0c04880
pkgrel=1
pkgdesc="A filemanager build with elementary"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git')
makedepends=('git' 'cmake' 'check')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/devs/bu5hm4n/jesus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr/ -DCMAKE_INSTALL_LIBDIR=/usr/lib

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  # install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
