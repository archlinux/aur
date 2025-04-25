# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'orchis-theme-git'
  'orchis-dracula-theme-git'
  'orchis-nord-theme-git'
)
pkgbase=orchis-theme-git
pkgver=2025.04.25.r0.g5b73376
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
arch=('any')
url="https://github.com/vinceliuice/Orchis-theme"
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'sassc'
)
optdepends=(
  'gnome-themes-extra: GTK2 theme support'
  'gtk-engine-murrine: GTK2 theme support'
  'kvantum-theme-orchis: Matching Kvantum theme'
  'tela-circle-icon-theme: Recommended icon theme'
  'vimix-cursors: recommended cursor theme'
)
options=('!strip')
install="${pkgbase%-git}.install"
source=('git+https://github.com/vinceliuice/Orchis-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Orchis-theme
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_orchis-theme-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Orchis-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks primary submenu -d "$pkgdir/usr/share/themes"

  # Wallpapers
  install -Dm644 wallpaper/*.jpg -t \
    "$pkgdir/usr/share/backgrounds/orchis/"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/firefox "$pkgdir/usr/share/doc/${pkgname%-git}/"
}

package_orchis-dracula-theme-git() {
  pkgdesc+=" (dracula variant)"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Orchis-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks primary submenu dracula -d "$pkgdir/usr/share/themes"
}

package_orchis-nord-theme-git() {
  pkgdesc+=" (nord variant)"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Orchis-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks primary submenu nord -d "$pkgdir/usr/share/themes"
}
