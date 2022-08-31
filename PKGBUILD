# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xrdesktop
pkgver=0.15.2
pkgrel=3
pkgdesc="Library for XR interaction with classical desktop compositors"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/xrdesktop"
license=('MIT')
depends=('glibc' 'glib2' 'gulkan' 'gxr')
makedepends=('meson' 'glslang' 'gtk-doc' 'python-gobject' 'vulkan-headers')
optdepends=('python')
source=("https://gitlab.freedesktop.org/xrdesktop/xrdesktop/-/archive/$pkgver/xrdesktop-$pkgver.tar.bz2")
sha256sums=('4745f55298188a16e6411394bb55a691a251915c2857a6f594f9336721cc9e67')


build() {
  cd "$pkgname-$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/xrdesktop"
}
