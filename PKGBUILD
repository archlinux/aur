# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=65
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:42')
makedepends=('glib2' 'npm' 'meson' 'gettext')
checkdepends=('reuse' 'eslint')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('faf2e6a02cd899273b7ef67659b7f61cc2d764c0767afc5a5da200604a9a6dee7c94524fb4e8eb88d2c91e0426c5f2b0e290c796922a2d7ee2c42e6de78dd630')

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
