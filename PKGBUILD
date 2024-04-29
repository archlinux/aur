# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=wespal
pkgver=0.5.0
pkgrel=1
pkgdesc="application for previewing and recoloring Wesnoth graphics (previously wesnoth-rcx)"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://irydacea.me/projects/wespal"
license=('LGPL')
depends=('qt6-base')
replaces=('wesnoth-rcx-git')
conflicts=('wesnoth-rcx-git')
makedepends=('git')
source=("git+https://github.com/irydacea/wespal.git#tag=v$pkgver")
md5sums=('SKIP')

pkgver() {
  cd wespal
  git describe | sed -e s/-/+/g -e s/^v//
}

prepare() {
  cd wespal
  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd wespal/build
  make
}

package() {
  cd wespal/build
  make install DESTDIR="$pkgdir"
}
