# Maintainer: LightDot <lightdot -a-t- g m a i l>

_pkgname=wds
pkgname=$_pkgname-git
pkgver=1.1.0.r4.ga488b16
pkgrel=2
pkgdesc="Miracast Wireless Display Software for Linux OS (WDS), Git version."
arch=('any')
url="https://01.org/wds"
license=('LGPL')
depends=('wpa_supplicant' 'connman' 'gstreamer' 'gst-libav' 'gst-plugins-bad' 'x264')
makedepends=('git' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/intel/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir" install

  # install license files
  install -Dm644 "$srcdir/$_pkgname/COPYING" \
        "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
