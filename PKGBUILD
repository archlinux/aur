# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgbase=xwayland-run
pkgver=0.0.3
pkgrel=1
pkgname=($pkgbase $pkgbase-cage $pkgbase-gnome-kiosk $pkgbase-kwin $pkgbase-mutter)
arch=(any)
url="https://gitlab.freedesktop.org/ofourdan/$pkgbase"
license=(GPL-2.0-or-later)
depends=(
  python
)
makedepends=(
  meson
)
optdepends=(
  'xorg-xwayland: X11 server'
)
options=(!debug)
source=($url/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz)
b2sums=('24217acf433948976a5af2471972fed6734caa3a6266dc5ab50e7039b8a352f1b3000e727463eab03c516eb9b7df9a662105e7b2fb23e6113e68a11f717d1872')

_build_and_install() {
  arch-meson $pkgbase-$pkgver $1 -Dcompositor=$1
  meson configure  $1 --no-pager
  meson compile -C $1
  meson install -C $1 --destdir "$pkgdir"
}

package_xwayland-run() {
  pkgdesc="Set of small utilities revolving around running Xwayland (Weston)"
  optdepends+=('weston: Wayland compositor')
  _build_and_install weston
}

package_xwayland-run-cage() {
  pkgdesc="Set of small utilities revolving around running Xwayland (Cage)"
  optdepends+=('cage: Wayland compositor')
  _build_and_install cage
}

package_xwayland-run-gnome-kiosk() {
  pkgdesc="Set of small utilities revolving around running Xwayland (Gnome Kiosk)"
  optdepends+=()
  _build_and_install gnome-kiosk
}

package_xwayland-run-kwin() {
  pkgdesc="Set of small utilities revolving around running Xwayland (KWin)"
  optdepends+=('kwin: Wayland compositor')
  _build_and_install kwin
}

package_xwayland-run-mutter() {
  pkgdesc="Set of small utilities revolving around running Xwayland (Mutter)"
  optdepends+=('mutter: Wayland compositor')
  _build_and_install mutter
}
