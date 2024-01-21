# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=orchis-theme-git
pkgver=2023.10.20.r0.gc30d107b
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
arch=('any')
url="https://github.com/vinceliuice/Orchis-theme"
license=('GPL-3.0-or-later')
makedepends=('git' 'sassc')
optdepends=('gnome-themes-extra: GTK2 theme support'
            'gtk-engine-murrine: GTK2 theme support'
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
