# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=nomacs
pkgname=$_pkgname-git
pkgver=3.2.0.r1446.g9eedbb1c
pkgrel=1
pkgdesc='Free, open source image viewer, which supports multiple platforms.'
arch=('i686' 'x86_64')
url='https://nomacs.org'
license=('GPL3')
depends=('qt5-svg' 'exiv2' 'libraw' 'opencv' 'quazip' 'desktop-file-utils')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/$_pkgname/$_pkgname.git")
sha256sums=("SKIP")

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's/-/.r/;s/-/./'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake "$srcdir/$_pkgname/ImageLounge" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_TRANSLATIONS=ON \
    -DUSE_SYSTEM_QUAZIP=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
