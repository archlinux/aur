# Maintainer: Sunner <sunnerlp at gmail dot com>
_pkgname=fluent-decoration
_branch=master
pkgname=$_pkgname-git
pkgver=r22.3251803
pkgrel=2
pkgdesc="Fluent-ish window decoration theme for KWin."
url='https://github.com/SuNNjek/fluent-decoration'
arch=('x86_64')
license=('GPL')
depends=('kdecoration')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}


package() {
  cd "$srcdir/$_pkgname/build"
  make -C "$srcdir/$_pkgname/build" DESTDIR="$pkgdir" install
}
