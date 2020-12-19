# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator

pkgver=10.0.0
pkgrel=1
_pkgfixver=$pkgver

_commit='4431c12f2b7920ef437b9a30068f7a545d72549d'
sha256sums=('142bb64f748e4edcedc71daa6997e403a4e7c4161b2aaf5dc522dee377cd7914')

pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'libappindicator-gtk3' 'meson' 'ninja' 'git' 'gobject-introspection' 'xorgproto')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/pamac-$_commit.tar.gz")

prepare() {
  cd "$srcdir/pamac-$_commit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-$_commit"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc

  # build
  ninja src/pamac-tray
}

package() {
  cd "$srcdir/pamac-$_commit"
  install -Dm755 "builddir/src/pamac-tray" "$pkgdir/usr/bin/pamac-tray"
  install -Dm644 "data/applications/pamac-tray.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray.desktop"
}
# vim:set ts=2 sw=2 et:
