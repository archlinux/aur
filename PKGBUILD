# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

_pkgname=gxr
pkgname=${_pkgname}0.15
pkgver=0.15.2
pkgrel=1
pkgdesc="glib wrapper for the OpenVR and soon the OpenXR API"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gxr"
license=('MIT')
provides=("$_pkgname=$pkgver")
depends=('glibc' 'glib2' 'gtk3' 'gulkan>=0.15' 'gulkan<0.16' 'openvr')
makedepends=('meson' 'glslang' 'vulkan-headers' 'libxtst' 'libdrm' 'glew' 'glfw' 'libegl')
optdepends=('glfw')
source=("https://gitlab.freedesktop.org/xrdesktop/gxr/-/archive/$pkgver/gxr-$pkgver.tar.bz2")
sha256sums=('2bd257d898f45b0c8510ce239604dd1ef4081cb8ee6079ac8042ed4c9e42ce4a')


build() {
  arch-meson "$_pkgname-$pkgver" build -Dexamples=false -Dtests=false
  meson compile -C build
}

check() {
  true
  #meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
