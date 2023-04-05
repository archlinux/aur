# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=jasper-gtk-theme-git
pkgver=r60.38bd785
pkgrel=1
pkgdesc="Jasper gtk theme for linux"
arch=('any')
url="https://www.pling.com/p/1891521"
license=('GPL3')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'colloid-icon-theme: Recommended icon theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'nephrite-gtk-theme')
replaces=('nephrite-gtk-theme-git')
options=('!strip')
install='jasper-theme.install'
source=('git+https://github.com/vinceliuice/Jasper-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Jasper-gtk-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Jasper-gtk-theme"
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
