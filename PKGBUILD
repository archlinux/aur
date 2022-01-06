# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('colloid-gtk-theme-git' 'colloid-icon-theme-git')
pkgbase=colloid-gtk-theme-git
pkgver=2021.12.09.r41.g6c1fa0c
pkgrel=1
pkgdesc="Modern and clean theme for linux"
arch=('any')
license=('GPL3')
makedepends=('git' 'gnome-shell' 'sassc')
options=('!strip')
source=('git+https://github.com/vinceliuice/Colloid-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Colloid-gtk-theme"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_colloid-gtk-theme-git() {
  pkgdesc="Modern and clean Gtk theme for linux"
  url="https://www.pling.com/p/1661959"
  optdepends=('gtk-engine-murrine: GTK2 theme support'
              'colloid-icon-theme: Matching icon theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Colloid-gtk-theme"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact -d "$pkgdir/usr/share/themes"

  # Nord version - currently missing assets: src/assets/gtk/assets-grey-nord
#  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes"
#  ./install.sh -t all -s compact --tweaks nord -d "$pkgdir/usr/share/themes"
}

package_colloid-icon-theme-git() {
  pkgdesc="Modern and clean icon theme for linux"
  url="https://www.pling.com/p/1661983"
  depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Colloid-gtk-theme"

  pushd icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -t all -d "$pkgdir/usr/share/icons"
  popd
}
