# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jasper-gtk-theme-git
pkgver=r114.f9c8317
pkgrel=1
pkgdesc="Jasper gtk theme for linux"
arch=('any')
url="https://github.com/vinceliuice/Jasper-gtk-theme"
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'sassc'
)
optdepends=(
  'colloid-icon-theme: Recommended icon theme'
  'gtk-engine-murrine: GTK2 theme support'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'nephrite-gtk-theme')
options=('!strip')
install='jasper-theme.install'
source=('git+https://github.com/vinceliuice/Jasper-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Jasper-gtk-theme
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd Jasper-gtk-theme
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
