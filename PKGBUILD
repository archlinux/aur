# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xrdesktop
pkgver=0.15.1
pkgrel=1
pkgdesc="Library for XR interaction with classical desktop compositors"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/xrdesktop"
license=('MIT')
depends=('glibc' 'glib2' 'gulkan' 'gxr')
makedepends=('meson' 'glslang' 'gtk-doc' 'vulkan-headers')
optdepends=('python')
source=("https://gitlab.freedesktop.org/xrdesktop/xrdesktop/-/archive/$pkgver/xrdesktop-$pkgver.tar.bz2")
sha256sums=('be59c5bd0a4b44677f208684ba5c132c2ebde64b416b0f562a2cc1faa13aaab3')


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
