# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: flan_suse
pkgname=xfce-theme-greybird
pkgver=3.23.1
pkgrel=1
pkgdesc="Desktop Suite for Xfce"
arch=('any')
url="https://shimmerproject.org"
license=('CC-BY-SA-3.0' 'GPL')
makedepends=('librsvg' 'meson' 'sassc')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'gtk3: required for CSS/GTK3 theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'gtk-engine-murrine: GTK2 theme support'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('d7e6b94f956874b819e2e17c2368ffd6babf02e5df7f08f508cee4380c3e4e8a')

build() {
  arch-meson "Greybird-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "Greybird-$pkgver"
  install -Dm644 LICENSE.CC -t "$pkgdir/usr/share/licenses/$pkgname"
}
