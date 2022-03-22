# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: flan_suse
pkgname=xfce-theme-greybird
pkgver=3.23.0
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
sha256sums=('2d71849e62d68edb38a6aaa2a44fe9212c3d75b817285d0fd56f3fbc759577b4')

build() {
  arch-meson "Greybird-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "Greybird-$pkgver"
  install -Dm644 LICENSE.CC -t "$pkgdir/usr/share/licenses/$pkgname"
}
