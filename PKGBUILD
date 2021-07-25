# Maintainer: Anton Karmanov <bergentroll@insiberia.net>
pkgname=spectral-matrix-git
pkgver=218.r648.g30028a2
pkgrel=1
epoch=
pkgdesc="Glossy cross-platform client for Matrix"
arch=(any)
url="https://gitlab.com/spectral-im/spectral"
license=('GPL3')
depends=(
  'cmark' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-svg'
  'qt5-tools' 'qtkeychain' 'libolm')
makedepends=('cmake' 'git')
options=()
source=("$pkgname::git+https://gitlab.com/spectral-im/spectral")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $pkgname
  git submodule update --init --recursive
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE='Release' ../
  make
}

package() {
  cd $pkgname/build
  make install
  rm -f $pkgdir/usr/share/icons/hicolor/icon-theme.cache
}
