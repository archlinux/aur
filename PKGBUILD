# Maintainer: maa <marten.andrejewski@gmail.com>

pkgname=qt-sesam-git
_gitname=Qt-SESAM
pkgver=2.1.0.BETA15.r6.ge697f53
pkgrel=1
pkgdesc="Super Easy & Secure Authentication Manager"
arch=('i686' 'x86_64')
url="https://github.com/ola-ct/Qt-SESAM/"
license=('GPL')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/ola-ct/Qt-SESAM/")
md5sums=('SKIP')

pkgver(){
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  lrelease Qt-SESAM/Qt-SESAM.pro
  qmake
  make
}

check() {
  cd "${_gitname}"
  make check
}

package() {
  cd "${_gitname}"
  make INSTALL_ROOT="/$pkgdir" install
} 
