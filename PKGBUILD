# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=kodi-platform-git
pkgver=r40.45d6ad1
pkgrel=1
pkgdesc='Kodi platform support library'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/xbmc/kodi-platform"
license=('GPL')
makedepends=('cmake' 'git')
depends=('kodi' 'libplatform')
provides=('kodi-platform')
conflicts=('kodi-platform')
source=("${pkgname}::git+https://github.com/xbmc/kodi-platform.git#commit=45d6ad1")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$pkgname/build"
  cd "$pkgname/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
