# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip-git
_gitname=ksnip
pkgver=continuous.r0.gff73c81
pkgrel=1
pkgdesc='Screenshot tool inspired by Windows Snipping Tool and made with Qt for Linux'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/ksnip'
license=('GPL')
depends=(qt5-x11extras
        kimageannotator
        kcolorpicker
        kimageannotator)
makedepends=(git
        cmake
        extra-cmake-modules
        qt5-tools)
provides=(ksnip)
conflicts=(ksnip)
source=("git+$url")
md5sums=(SKIP)

prepare(){
  cd "$srcdir/$_gitname"
  test -d build || mkdir build
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$_gitname/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package(){
  cd "$srcdir"/$_gitname/build
  make DESTDIR="$pkgdir" install
}

