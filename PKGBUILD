# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=colloid-gtk-theme-git
pkgver=2023.04.11.r19.g5006d204
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
install="${pkgname%-git}.install"
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
  ./install.sh -t all -s compact --tweaks normal -d "$pkgdir/usr/share/themes"

  # Nord version
  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks nord -d "$pkgdir/usr/share/themes"

  # Dracula version
  ./install.sh -t all --tweaks dracula -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks dracula -d "$pkgdir/usr/share/themes"

  # Gruvbox version
  ./install.sh -t all --tweaks gruvbox -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks gruvbox -d "$pkgdir/usr/share/themes"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/other/firefox "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
