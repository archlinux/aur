# Maintainer: Sunner <sunnerlp at gmail dot com>
_pkgname=avisynth-plugin-rotate
_branch=master
pkgname=$_pkgname-git
pkgver=r3.a6e77bf
pkgrel=1
pkgdesc="Rotate plugin for AviSynth+"
url='https://github.com/SuNNjek/rotate-plugin'
arch=('x86_64')
license=('GPL')
makedepends=('git' 'cmake' 'avisynthplus')
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
