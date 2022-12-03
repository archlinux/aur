# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xrdesktop
pkgver=0.16.0
pkgrel=1
pkgdesc="Library for XR interaction with classical desktop compositors"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/xrdesktop"
license=('MIT')
depends=('glibc' 'g3k')
checkdepends=('glew')
makedepends=('meson' 'gtk-doc' 'python-gobject')
optdepends=('python')
source=("https://gitlab.freedesktop.org/xrdesktop/xrdesktop/-/archive/$pkgver/xrdesktop-$pkgver.tar.bz2")
sha256sums=('0c661fbb454ff4c5559818b6ea9441c7288253ce29003e5f0f819ca2e916671c')


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
