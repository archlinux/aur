# Maintainer: Jan Kraus <kraus@itc.rwth-aachen.de>

_pkgname=owncloud-client-desktop-shell-integration-dolphin
pkgname=${_pkgname}-git
pkgver=r17.bddcf5c
pkgrel=1
pkgdesc='ownCloud Dolphin integration'
url="https://github.com/owncloud/client-desktop-shell-integration-dolphin"
license=('GPL-2.0')
arch=('any')
depends=('owncloud-client')
makedepends=('git' 'cmake' 'extra-cmake-modules>=5.52.0')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release ..
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr"
}


package() {
  cd "$srcdir/$_pkgname/build"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim: ft=sh ts=2 sw=2 et
