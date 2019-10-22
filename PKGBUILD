# Maintainer: Anton Karmanov <bergentroll@insiberia.net>
pkgname=spectral-matrix-git
pkgver=218.r574.g04bb4b1
pkgrel=1
epoch=
pkgdesc="Glossy cross-platform client for Matrix"
arch=(any)
url="https://gitlab.com/b0/spectral"
license=('GPL3')
depends=(
  'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-svg'
  'qt5-tools' 'qtkeychain' 'libolm')
makedepends=('cmake' 'cmark' 'git')
options=()
source=("$pkgname::git+https://gitlab.com/b0/spectral.git")
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
  rm $pkgdir/usr/share/icons/hicolor/icon-theme.cache
}
