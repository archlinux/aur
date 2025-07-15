# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'colloid-gtk-theme-git'
  'colloid-catppuccin-gtk-theme-git'
  'colloid-dracula-gtk-theme-git'
  'colloid-everforest-gtk-theme-git'
  'colloid-gruvbox-gtk-theme-git'
  'colloid-nord-gtk-theme-git'
)
pkgbase=colloid-gtk-theme-git
pkgver=2024.11.16.r22.g15f9b99
pkgrel=1
pkgdesc="Gtk theme for Linux"
arch=('any')
url="https://github.com/vinceliuice/Colloid-gtk-theme"
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'sassc'
)
optdepends=(
  'colloid-cursors: Matching cursor theme'
  'colloid-icon-theme: Matching icon theme'
  'gtk-engine-murrine: GTK2 theme support'
)
options=('!strip')
install="${pkgbase%-git}.install"
source=('git+https://github.com/vinceliuice/Colloid-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Colloid-gtk-theme
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Colloid-gtk-theme

  # Don't call clean_theme function
  sed -i 's/clean_theme && install_theme/install_theme/g' install.sh
}

package_colloid-gtk-theme-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact -d "$pkgdir/usr/share/themes"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/other/firefox "$pkgdir/usr/share/doc/${pkgname%-git}/"
}

package_colloid-catppuccin-gtk-theme-git() {
  pkgdesc="Gtk Catppuccin theme for Linux"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks catppuccin -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks catppuccin -d "$pkgdir/usr/share/themes"
}

package_colloid-dracula-gtk-theme-git() {
  pkgdesc="Gtk Dracula theme for Linux"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks dracula -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks dracula -d "$pkgdir/usr/share/themes"
}

package_colloid-everforest-gtk-theme-git() {
  pkgdesc="Gtk Everforest theme for Linux"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks everforest -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks everforest -d "$pkgdir/usr/share/themes"
}

package_colloid-gruvbox-gtk-theme-git() {
  pkgdesc="Gtk Gruvbox theme for Linux"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks gruvbox -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks gruvbox -d "$pkgdir/usr/share/themes"
}

package_colloid-nord-gtk-theme-git() {
  pkgdesc="Gtk Nord theme for Linux"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks nord -d "$pkgdir/usr/share/themes"
}
