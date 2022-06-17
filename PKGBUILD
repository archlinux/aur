# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=colloid-gtk-theme-git
pkgver=2022.05.15.r2.g65f141f2
pkgrel=1
pkgdesc="Modern and clean Gtk theme for linux"
arch=('any')
url="https://www.pling.com/p/1661959"
license=('GPL3')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'colloid-icon-theme: Matching icon theme'
            'colloid-cursors: Matching cursor theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/vinceliuice/Colloid-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Colloid-gtk-theme"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/Colloid-gtk-theme"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact -d "$pkgdir/usr/share/themes"

  # Nord version
  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks nord -d "$pkgdir/usr/share/themes"
}
