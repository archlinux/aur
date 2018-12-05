# Maintainer: bergentroll <bergentroll@insiberia.net>

arch=('x86_64' 'i686')
conflicts=('midori' 'midori-git' 'midori-gtk2-git')
depends=('aria2' 'gcr' 'libpeas' 'libxss' 'webkit2gtk' 'zeitgeist')
license=('LGPL')
makedepends=('cmake' 'gobject-introspection' 'intltool' 'ninja' 'vala')
md5sums=('99ed608331f8894dc3e069bc1c58eedd')
pkgdesc="Lightweight web browser"
pkgname=midori7
pkgrel=1
pkgver=7.0
provides=('midori')
source=("https://github.com/midori-browser/core/archive/v7.tar.gz")
url="https://www.midori-browser.org/"

build() {
  cd "$srcdir/core-7"
  mkdir -p build
  cd build
  cmake "../" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -DVALA_CFLAGS="$CFLAGS -fPIC -w" \
    -G Ninja
  ninja
}

package() {
  cd "$srcdir/core-7"
  DESTDIR="$pkgdir" ninja -C build install
}
