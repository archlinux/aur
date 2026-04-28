# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-run
pkgver=0.0.6
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
sha512sums=('9ca28131fca26a1eea685eb6a2cdf864882ba8beb04c0f48725e76902166800a7925501951c7c0c14fc634c673228dab7c1b19be6ef557ec2a308e51d070ba79')
b2sums=('6a39a797573975b75128282b7e7a15a1fcc4d663a90debff90fdf7b5c1e3162cf623b7d569a7a698bbfb67e34492e57f40a8dec763f772a95e37f2187f7810cd')

build() {
  arch-meson $pkgbase-$pkgver build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
