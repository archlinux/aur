# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=orchis-theme-git
pkgver=2023.03.18.r7.gec38a73
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
arch=('any')
url="https://www.pling.com/p/1357889"
license=('GPL3')
depends=('gtk3' 'gnome-themes-extra')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'kvantum-theme-orchis: Matching Kvantum theme'
            'tela-circle-icon-theme: Recommended icon theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Orchis-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks primary -d "$pkgdir/usr/share/themes/"

  # Wallpapers
  install -Dm644 src/wallpaper/*.jpg -t \
    "$pkgdir/usr/share/backgrounds/orchis/"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/firefox "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
