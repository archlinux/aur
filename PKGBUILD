# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>
# Contributor: Ner0
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=xfce-theme-greybird-git
pkgver=3.23.4+0
pkgrel=1
pkgdesc="Desktop theme suite from Xubuntu, with support for Xfce, Metacity and Unity"
arch=('any')
url="https://github.com/shimmerproject/Greybird"
# https://shimmerproject.org
license=('CC-BY-SA-3.0' 'GPL-2.0-or-later')
depends=('gtk-engine-murrine')
makedepends=('git'
	     'meson'
	     'sassc'
	     'librsvg')
optdepends=('elementary-xfce-icons: Use the stable or -git icon set'
	    'gtk-engine-murrine: GTK2 theme support'
	    'gtk3: required for CSS/GTK3 theme'
	    'gtk4: For the GTK4 support'
            'shimmer-wallpapers: Contains the Greybird wallpaper, among others'
            'lightdm-gtk-greeter: Required for the LightDM GTK theme'
	    'lib32-gtk-engine-murrine: Required for GTK2 in 32-bit apps for a 64-bit environment')
provides=('xfce-theme-greybird')
conflicts=('xfce-theme-greybird')
options=('!strip')
source=('Greybird::git+https://github.com/shimmerproject/Greybird.git')
md5sums=('SKIP')

pkgver() {
  cd "Greybird"
#  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
  echo "$(git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/+/' | sed 's/v//g' )"
}

build(){
  arch-meson "Greybird" build
  meson compile -C build
}
package() {
  meson install -C build --destdir "$pkgdir"

  cd "Greybird"
  install -Dm644 LICENSE.CC -t "$pkgdir/usr/share/licenses/$pkgname/"
}
