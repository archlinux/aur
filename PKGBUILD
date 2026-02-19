# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-run
pkgver=0.0.5
pkgrel=1
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
sha512sums=('ca2638c5beeb3efe37e974ae6e586251c30cf9151af27eb39b3a4646ae0ea615b0606d3ca1e1cb13d54a15f85beff2af6abfd7537574205436cc3cc82df86fe2')
b2sums=('f5fdbb8df3a170288372977a9d4d4e6d08955901708caed06f5613f914b41c9a8c98a554ca9a3d68cf21e2e78ddb318b74d4720f40d623861f1503b1f634304f')

build() {
  arch-meson $pkgbase-$pkgver build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
