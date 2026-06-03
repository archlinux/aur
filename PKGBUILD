# Maintainer: Capricornus007 <Capricornus007 at proton dot me>
# Co-Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

_pkgname=xcb-imdkit
pkgname=${_pkgname}-git
pkgver=1.0.9.r0.g44f5c82
pkgrel=1
pkgdesc="Input method development support for xcb"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/xcb-imdkit"
license=('GPL')
depends=('xcb-util' 'xcb-util-keysyms' 'glibc' 'libxcb')
makedepends=('extra-cmake-modules' 'git' 'ninja' 'uthash')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/fcitx/xcb-imdkit.git")
sha512sums=('SKIP')

pkgver() {
  cd xcb-imdkit
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd xcb-imdkit

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib . \
  make
}

package() {
  cd xcb-imdkit
  make DESTDIR="$pkgdir" install
}
