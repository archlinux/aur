# Contributor: Yauheni Kirylau <yawghen-gmail-dot-com>

_pkgname=libui
pkgname=${_pkgname}-git
pkgver=alpha4.1.r315.g1b058468
pkgrel=1
pkgdesc='A portable GUI library for C'
arch=('i686' 'x86_64')
url='https://github.com/andlabs/libui'
license=('MIT')
depends=('gtk3' 'libx11' 'libxcb' 'libffi')
makedepends=('make' 'gcc' 'cmake' 'meson' 'ninja')
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
  meson build
  ninja -C build
  cd build/meson-out
  ln -sf libui.so.0 libui.so
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{lib,include}
  install build/meson-out/libui.so ${pkgdir}/usr/lib/
  install build/meson-out/libui.so.0 ${pkgdir}/usr/lib/
  install ui.h ${pkgdir}/usr/include/
  install ui_unix.h ${pkgdir}/usr/include/
}
