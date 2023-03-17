# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

_pkgname=xrdesktop
pkgname=${_pkgname}0.15
pkgver=0.15.2
pkgrel=1
pkgdesc="Library for XR interaction with classical desktop compositors"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/xrdesktop"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('glibc' 'glib2' 'gxr>=0.15' 'gxr<0.16')
makedepends=('meson' 'glslang' 'gtk-doc' 'python-gobject' 'vulkan-headers')
optdepends=('python')
source=("https://gitlab.freedesktop.org/xrdesktop/xrdesktop/-/archive/$pkgver/xrdesktop-$pkgver.tar.bz2")
sha256sums=('4745f55298188a16e6411394bb55a691a251915c2857a6f594f9336721cc9e67')


build() {
  arch-meson "$_pkgname-$pkgver" "build" -Dtests=false
  meson compile -C "build"
}

check() {
  true
  #meson test -C "build"
}

package() {
  meson install -C "build" --destdir "$pkgdir"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
