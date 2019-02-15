# Maintainer: Anton Karmanov <bergentroll@insiberia.net>
pkgname=spectral-git
pkgver=218.r272.g91fe860
pkgrel=1
epoch=
pkgdesc="Glossy cross-platform client for Matrix"
arch=(any)
url="https://gitlab.com/b0/spectral"
license=('GPL3')
depends=('qt5-tools' 'qt5-quickcontrols2' 'qt5-graphicaleffects')
makedepends=('cmake')
options=()
source=("$pkgname::git+https://gitlab.com/b0/spectral.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $pkgname
  git submodule init
  git submodule update
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  qmake PREFIX="$pkgdir/usr/" ../spectral.pro
  make
}

package() {
  cd $pkgname/build
  make install
}
