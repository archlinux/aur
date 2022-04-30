# Maintainer: Angelo Haller <aur.archlinux@szanni.org>
pkgname=libui-ng
pkgver=alpha4.1.r484.gbaae3e47
pkgrel=1
epoch=1
pkgdesc="A portable GUI library for C."
arch=('x86_64')
url="https://github.com/libui-ng/libui-ng"
license=('MIT')
depends=('gtk3>=3.10')
makedepends=('meson' 'ninja')
source=("$pkgname"::'git+https://github.com/libui-ng/libui-ng.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  meson build
  ninja -C build
  cd build/meson-out
  ln -sf libui.so.0 libui.so
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m644 ui.h "${pkgdir}/usr/include/ui.h"
  install -D -m755 build/meson-out/libui.so "${pkgdir}/usr/lib/libui.so"
  install -D -m755 build/meson-out/libui.so.0 "${pkgdir}/usr/lib/libui.so.0"
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

