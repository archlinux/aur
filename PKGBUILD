# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xrdesktop
pkgver=0.14.1
pkgrel=1
pkgdesc="Library for XR interaction with classical desktop compositors"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/xrdesktop"
license=('MIT')
depends=('glibc' 'glib2' 'gulkan' 'gxr')
makedepends=('meson' 'glslang' 'gtk-doc' 'vulkan-headers')
source=("https://gitlab.freedesktop.org/xrdesktop/xrdesktop/-/archive/$pkgver/xrdesktop-$pkgver.tar.bz2")
sha256sums=('5b466ca157442a4a1470eb7c9054aea01785a4516d625cbd0e3685233a093472')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/xrdesktop"
}
