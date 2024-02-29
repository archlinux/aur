# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>

pkgname=plasma6-applets-places-widget
pkgver=1.4
pkgrel=2
pkgdesc="Plasma 6 widget providing quick access to user places"
arch=(any)
url="https://github.com/dfaust/plasma-applet-places-widget"
license=(GPL-2.0-only)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"${url}/archive/v${pkgver}.tar.gz"
        "${url}/commit/bc3f45eca28b7f7333edc2918cbefe03705cd793.diff")
sha256sums=('dde5ac73516794cce1e7af9dcb9ee43fcad13125c647451662ab5dc136463602'
            'f6e6523d29339561853251371058c6b00341de593212d864f18f118fa5050090')

prepare() {
  cd "$srcdir/plasma-applet-places-widget-$pkgver"
  # patch for Plasma 6 support
  patch -p1 < "$srcdir/bc3f45eca28b7f7333edc2918cbefe03705cd793.diff"
}

build() {
  cd "$srcdir/plasma-applet-places-widget-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir"/plasma-applet-places-widget-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
