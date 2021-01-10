# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: flan_suse
pkgname=xfce-theme-greybird
pkgver=3.22.14
pkgrel=1
pkgdesc="Desktop Suite for Xfce"
arch=('any')
url="https://shimmerproject.org"
license=('CC-BY-SA-3.0' 'GPL')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('librsvg' 'meson' 'sassc')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('37fc4b8f83ff667e43e9889f6605a9e5da2ce2f5c5801c1ceef90814fb57b294')

build() {
	arch-meson "Greybird-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	cd "Greybird-$pkgver"
	install -Dm644 LICENSE.CC -t "$pkgdir/usr/share/licenses/$pkgname"
}
