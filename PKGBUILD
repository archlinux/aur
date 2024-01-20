# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=colloid-gtk-theme-git
pkgver=2023.10.28.r0.g46fa7423
pkgrel=1
pkgdesc="Modern and clean Gtk theme for linux"
arch=('any')
url="https://github.com/vinceliuice/Colloid-gtk-theme"
license=('GPL-3.0-or-later')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'colloid-icon-theme: Matching icon theme'
            'colloid-cursors: Matching cursor theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=('git+https://github.com/vinceliuice/Colloid-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Colloid-gtk-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks normal -d "$pkgdir/usr/share/themes"

  # Nord, Dracula & Gruvbox versions
  ./install.sh -t all --tweaks all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks all -d "$pkgdir/usr/share/themes"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/other/firefox "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
