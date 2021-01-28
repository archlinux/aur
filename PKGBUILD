# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=wesnoth-rcx-git
pkgver=0.3.0
pkgrel=1
pkgdesc="small desktop application for previewing and recoloring Wesnoth graphics"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://shadowm.ai0867.net/projects/wesnoth-rcx"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
source=("git+https://github.com/shikadiqueen/morningstar.git")
md5sums=('SKIP')

pkgver() {
  cd morningstar

  git describe | sed s/-/+/g
}

prepare() {
  cd morningstar

  sed -i "s;/usr/local;$pkgdir/usr;" morningstar.pro
  qmake -config release QMAKE_CXXFLAGS_RELEASE+="${CXXFLAGS} ${CPPFLAGS}" \
                        QMAKE_LFLAGS_RELEASE+="${LDFLAGS}"
}

build() {
  cd morningstar

  make
}

package() {
  cd morningstar

  make install
}
