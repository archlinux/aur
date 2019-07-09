# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
pkgname=pamac-cli
pkgver=8.0.3
pkgrel=1
_pkgfixver=$pkgver

_pkgvercommit=v$pkgver
# _pkgvercommit=a1ea02d9180bf8708f40a50939f455ac5fe34435
sha256sums=('63c65e51f5f62ae79faf315e395e5e15bfa23d5f36b138d02613d32bf097a6e8')

pkgdesc="Pamac cli frontend for libalpm"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'curl' 'pacman>=5.1' 'appstream-glib' 'archlinux-appstream-data')
optdepends=('')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'meson' 'ninja' 'git' 'gobject-introspection')
conflicts=('pamac' 'pamac-aur' 'pamac-aur-git')
provides=('pamac')
replaces=('pamac')
options=(!emptydirs)
install=

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_pkgvercommit/pamac-$_pkgvercommit.tar.gz")

prepare() {
  cd "$srcdir/pamac-$_pkgvercommit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-$_pkgvercommit"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc

  # build
  ninja src/pamac
}

package() {
  cd "$srcdir/pamac-$_pkgvercommit/builddir"
  install -Dm755 "src/pamac" "$pkgdir/usr/bin/pamac"
  install -Dm755 "src/libpamac.so" "$pkgdir/usr/lib/libpamac.so"


}
# vim:set ts=2 sw=2 et:
