# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=whitesur-gtk-theme-git
pkgver=2025.04.03.r23.gf67de5ae
pkgrel=1
pkgdesc="MacOS Big Sur like theme for GNOME desktops"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
license=('GPL')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'whitesur-icon-theme-git: matching icon theme'
            'whitesur-cursor-theme-git: matching cursor theme'
            'whitesur-kvantum-theme: matching Kvantum theme'
            'gnome-shell-extension-dash-to-dock: recommended GNOME extension'
            'gnome-shell-extension-blur-my-shell: recommended GNOME extension')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd WhiteSur-gtk-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd WhiteSur-gtk-theme
  install -d "$pkgdir/usr/share/themes"

  # See for more customization options:
  # https://github.com/vinceliuice/WhiteSur-gtk-theme#theres-so-many-customizations-you-can-do
  ./install.sh --theme all --alt all --dest "$pkgdir/usr/share/themes"

  # Plank theme
  install -Dm644 src/other/plank/theme-Dark/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-Dark"
  install -Dm644 src/other/plank/theme-Light/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-Light"

  # Firefox theme
  install -d "$pkgdir/usr/share/docs/$pkgname"
  cp -r src/other/firefox "$pkgdir/usr/share/docs/$pkgname"
}
