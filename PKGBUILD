# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Jeremy Newton (Mystro256)

pkgname=mist-icon-theme
pkgver=3.0.0+20+gaaba3bb
pkgrel=2
pkgdesc="Mist icon theme"
arch=('any')
url="https://wiki.gnome.org/Design"
license=('GPL')
depends=('gtk-update-icon-cache' 'gnome-icon-theme')
makedepends=('git' 'gtk-engines' 'icon-naming-utils' 'gnome-common')
_commit=aaba3bb83add369a480f393a8d0907f6ea72b285
source=("git+https://gitlab.gnome.org/Archive/gnome-themes.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "gnome-themes"
  git describe --long | sed 's/GNOME_THEMES_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "gnome-themes"

  # Revert 'Switch to GTK+ 3.0', it requires non-existent gtk-engines-3
  git revert --no-commit 7c840124d0ed9e946fd7713f8a5761ea40a741f5
}

build() {
  cd "gnome-themes"

  ./autogen.sh --prefix=/usr --disable-dependency-tracking
  make -C icon-themes/Mist
}

package() {
  cd "gnome-themes"

  make DESTDIR="${pkgdir}" -C icon-themes/Mist install
}

# vim:set ts=2 sw=2 et:
