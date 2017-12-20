# $Id$
# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=fcitx-chewing
pkgname=${_pkgname}-git
pkgver=0.2.3.r4.ge4bb273
pkgrel=2
pkgdesc='Fcitx Wrapper for chewing'
arch=(i686 x86_64)
url='https://github.com/fcitx/fcitx-chewing'
license=(GPL)
depends=(libchewing-git fcitx)
makedepends=(cmake git)
source=("git+https://github.com/fcitx/fcitx-chewing.git")
md5sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_pkgname}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install
}
