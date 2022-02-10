# Contrubutor: Nick Boughton <nicholasboughton at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whitesur-gtk-theme-nord-git
pkgver=2021.12.28.r18.g12ef7d1
pkgrel=1
pkgdesc="MacOS Big Sur like theme for GNOME desktops, but just the nord colourscheme"
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
conflicts=("${pkgname%-git}" "whitesur-gtk-theme" "whitesur-gtk-theme-git")
install="whitesur-gtk-theme-nord.install"
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
  ./install.sh \
    --icon arch \
    --theme all \
    --nord \
    --nautilus-style glassy \
    --name WhiteSur-nord \
    --dest "$pkgdir/usr/share/themes"

  # Plank theme
  install -Dm644 src/other/plank/theme-dark/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-dark"
  install -Dm644 src/other/plank/theme-light/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-light"

  # Firefox theme
  install -d "$pkgdir/usr/share/docs/$pkgname"
  cp -r src/other/firefox "$pkgdir/usr/share/docs/$pkgname"
}
