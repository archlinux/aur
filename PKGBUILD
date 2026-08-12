# Maintainer: mi4code

pkgname=libhui-git
pkgver=r44.ea2df2e
pkgrel=1
pkgdesc='Library aiming to deliver simple API for building apps with HTML+CSS+JS UI in C/C++/Python/Rust and thus make developing GUI app as easy as it can be.'
url='https://github.com/mi4code/HUI'
arch=(x86_64 aarch64 armv7h i686)
license=('LGPL2.1')
depends=('gtk3' 'webkit2gtk-4.1' 'gtk-layer-shell')
makedepends=()
provides=('libhui')
conflicts=('libhui')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HUI"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/HUI"
  chmod +x ./build_linux_gtk3.sh
  ./build_linux_gtk3.sh
}

package() {
  install -Dm755 "$srcdir/HUI/HUI-linux-$(uname -m)-webkit-gtk3/libHUI.so" "$pkgdir/usr/lib/libHUI.so"
  install -Dm644 "$srcdir/HUI/HUI.h" "$pkgdir/usr/include/HUI/HUI.h"
  install -Dm644 "$srcdir/HUI/HUI.hh" "$pkgdir/usr/include/HUI/HUI.hh"
  install -Dm644 "$srcdir/HUI/hui_datatypes.h" "$pkgdir/usr/include/HUI/hui_datatypes.h"
  install -Dm644 "$srcdir/HUI/LICENSE" "$pkgdir/usr/share/licenses/libHUI/LICENSE"
}
