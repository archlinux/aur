# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>
# Contributor: Ner0
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=xfce-theme-greybird-git
pkgver=3.23.3+0
pkgrel=1
pkgdesc="Desktop theme suite from Xubuntu, with support for Xfce, Metacity and Unity"
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('CCPL:by-sa-3.0' 'GPL')
depends=('gtk-engine-murrine')
makedepends=('git' 'meson' 'sassc')
optdepends=('elementary-xfce-icons: Matching icon set; use the dark icon theme'
            'shimmer-wallpapers: Contains the Greybird wallpaper, among others'
            'lightdm-gtk-greeter: Required for the LightDM GTK theme''lib32-gtk-engine-murrine: Required for 32-bit apps in 64-bit environments')
provides=('xfce-theme-greybird')
conflicts=('xfce-theme-greybird')
options=('!strip')
source=('Greybird::git+https://github.com/shimmerproject/Greybird.git')
#branch=gtk3.20')
md5sums=('SKIP')

pkgver() {
  cd "Greybird"
#  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
	echo "$(git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/+/' | sed 's/v//g' )"
}

build(){
  arch-meson Greybird build
  ninja -C build
}
package() {
  DESTDIR="$pkgdir" ninja -C build install
}
