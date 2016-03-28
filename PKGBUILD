# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=asma-git
pkgver=7.8f07b9a
pkgrel=1
pkgdesc="Simple Arma 3 launcher for Linux"
arch=('i686' 'x86_64')
url="https://github.com/busquetsaguilopau/asma"
license=('GPL3')
depends=('gtk3' 'steam')
makedepends=('cmake' 'git')
provides=('asma')
conflicts=('asma')
install=asma-git.install
source=("$pkgname::git://github.com/busquetsaguilopau/asma.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname/src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  make DESTDIR="$pkgdir" install
}
