# Contributor: Yauheni Kirylau <yawghen-gmail-dot-com>

_pkgname=libui
pkgname=${_pkgname}-git
pkgver=alpha4.1.r91.g39d4542d
pkgrel=1
pkgdesc='A portable GUI library for C'
arch=('i686' 'x86_64')
url='https://github.com/andlabs/libui'
license=('MIT')
depends=('gtk3' 'libx11' 'libxcb' 'libffi')
makedepends=('make' 'gcc' 'cmake')
provides=('libui')
conflicts=('libui')
source=("$pkgname::git://github.com/andlabs/libui.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{lib,include}
  install build/out/libui.so ${pkgdir}/usr/lib/
  install build/out/libui.so.0 ${pkgdir}/usr/lib/
  install ui.h ${pkgdir}/usr/include/
  install ui_unix.h ${pkgdir}/usr/include/
}
