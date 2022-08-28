# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nephrite-gtk-theme-git
pkgver=r1.c277536
pkgrel=2
pkgdesc="Nephrite gtk theme for linux"
arch=('any')
url="https://www.pling.com/p/1891521"
license=('GPL3')
depends=('gnome-themes-extra' 'gtk3')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'colloid-icon-theme: Recommended icon theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install='nephrite-theme.install'
source=('git+https://github.com/vinceliuice/Nephrite-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Nephrite-gtk-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Nephrite-gtk-theme"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes/"
  ./install.sh -t all -s compact -d "$pkgdir/usr/share/themes/"

  # Nord version
  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes/"
  ./install.sh -t all -s compact --tweaks nord -d "$pkgdir/usr/share/themes/"

  # Dracula version
  ./install.sh -t all --tweaks dracula -d "$pkgdir/usr/share/themes/"
  ./install.sh -t all -s compact --tweaks dracula -d "$pkgdir/usr/share/themes/"
}
