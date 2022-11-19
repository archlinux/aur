# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gxr
pkgver=0.16.0
pkgrel=1
pkgdesc="glib wrapper for the OpenVR and soon the OpenXR API"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gxr"
license=('MIT')
depends=('glibc' 'glib2' 'gtk3' 'gulkan' 'openxr')
makedepends=('meson' 'glslang' 'vulkan-headers')
optdepends=('glfw')
source=("https://gitlab.freedesktop.org/xrdesktop/gxr/-/archive/$pkgver/gxr-$pkgver.tar.bz2")
sha256sums=('6b21ce02af8d5f723a03833c8e17857ee68c0a4e91e444f8f741c435599bbb33')


build() {
  cd "$pkgname-$pkgver"

  meson setup \
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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gxr"
}
