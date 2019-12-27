# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=wds
pkgver=1.1.0
pkgrel=2
pkgdesc="Miracast Wireless Display Software for Linux OS (WDS)."
arch=('any')
url="https://01.org/wds"
license=('LGPL')
depends=('wpa_supplicant' 'connman' 'gstreamer' 'gst-libav' 'gst-plugins-bad' 'x264')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/intel/wds/archive/v1.1.0.tar.gz")
sha256sums=('6c3f11f1ce130d388047b456647b229c452cce72c6e13a4f2288f1f89d51250f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install

  # install license files
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
