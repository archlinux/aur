# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-git 
pkgver=0.0.14.r21.gfd49b2f
pkgrel=1
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git  describe --tags | sed 's+-+.r+'|tr - .
}

build() {
  cd ${pkgname%-git}
  
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  qmake-qt5 CONFIG+=release ..
  make
}

package() {
  cd ${pkgname%-git}
  cd build
  make install INSTALL_ROOT=$pkgdir
}

