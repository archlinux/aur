# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gxr
pkgver=0.15.1
pkgrel=1
pkgdesc="glib wrapper for the OpenVR and soon the OpenXR API"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gxr"
license=('MIT')
depends=('glibc' 'glib2' 'gtk3' 'gulkan' 'openvr')
makedepends=('meson')
optdepends=('glfw')
source=("https://gitlab.freedesktop.org/xrdesktop/gxr/-/archive/$pkgver/gxr-$pkgver.tar.bz2")
sha256sums=('a58b847cdb06e1df75f201228b9fe0d6f1473a0fa4a999055907ec19f0345e06')


build() {
  cd "$pkgname-$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  ninja -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gxr"
}
