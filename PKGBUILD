# Maintainer: geearf

pkgname=('corgids-git')
pkgver=0.1
pkgrel=1
pkgdesc='A Nintendo DS emulator'
arch=('x86_64')
url='https://corgids.wordpress.com/'
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git' 'qt5-base')
options=('!emptydirs')
source=('corgids::git+https://github.com/PSI-Rockin/CorgiDS.git')
sha256sums=('SKIP')
provides=('corgids')

#pkgver() {
#  cd corgids

#  git describe | sed 's/-/.r/; s/-g/./'
#}

prepare() {
  cd corgids

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd corgids/build

  qmake-qt5 ../CorgiDS
  make
}

package() {
  cd corgids/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 CorgiDS "${pkgdir}"/usr/bin/corgids
}
