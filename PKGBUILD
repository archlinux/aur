# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-run
pkgver=0.0.4
pkgrel=4
pkgdesc="Set of small utilities revolving around running Xwayland"
arch=(any)
url="https://gitlab.freedesktop.org/ofourdan/$pkgname"
license=(GPL-2.0-or-later)
depends=(
  python
  xorg-xauth
)
makedepends=(meson)
optdepends=(
  'cage: Wayland compositor (no headless)'
  'gnome-kiosk: Wayland compositor'
  'kwin: Wayland compositor'
  'mutter: Wayland compositor'
  'weston: Wayland compositor'
  'xorg-xwayland: X11 server'
)
provides=(wlheadless-run xwfb-run)
conflicts=(wlheadless-run xwfb-run)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('280edfe833f8e298d48f3e35a7f0a35c2ab408eaaa7e5337464d9c55653cd3d2c4469431842338f4bd13ee545a5ea8092e26f45bebafd98f17eb4c4d5fef01ed')
b2sums=('31eae9fbb1a4f8ce112400ccd2e00e28fa78cb880949ac9b291998dddbe1caeb4eb97dec249189ea6b6ba2cb9e87d9687766815bcba5a2cd4f4ea0fca8b27ca2')

build() {
  arch-meson $pkgbase-$pkgver build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
