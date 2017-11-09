# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=asma-git
pkgver=48.081fd20
pkgrel=1
pkgdesc="Simple Arma 3 launcher for Linux"
arch=('i686' 'x86_64')
url="https://github.com/her001/asma"
license=('GPL3')
depends=('gtk3' 'steam')
makedepends=('meson' 'git')
provides=('asma')
conflicts=('asma')
install=asma-git.install
source=("$pkgname::git://github.com/her001/asma.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix=/usr build
  cd build
  ninja
}

package() {
  cd "$srcdir/$pkgname/build"
  DESTDIR="$pkgdir" ninja install
  cd "$srcdir/$pkgname"
  rm -rf build
}
