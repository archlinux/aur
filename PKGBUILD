# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:	Bjoern Franke <bjo at nord-west.org>
# Contributor:	flan_suse

pkgname=xfce-theme-greybird
pkgver=1.6.2
pkgrel=4
pkgdesc="A grey and blue Xfce theme, used by default in Xubuntu 12.04"
arch=('any')
url="http://shimmerproject.org/projects/greybird/"
license=('CCPL:by-sa-3.0' 'GPL')
groups=('xfce-themes-shimmer-collection')
conflicts=("$pkgname-git")
depends=('gtk-engine-murrine')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
	    'gtk3: required for CSS/GTK3 theme'
	    'lightdm-gtk-greeter: required for the LightDM GTK theme'
	    'lightdm-unity-greeter: required for the LightDM Unity theme'
	    'shimmer-wallpapers: contains the Greybird wallpaper, among others'
	    'lib32-gtk-engine-murrine: required for multilib')
_surl="https://github.com/shimmerproject"
source=("$pkgname-$pkgver.tar.gz"::"$_surl/Greybird/archive/v$pkgver.tar.gz"
	"GTK3.20-patch.tar.gz"::"https://github.com/Poultryphile/xfce-theme-greybird/archive/1.6.2.tar.gz")
sha256sums=('473a38b379381311b68dcc579005c0d5bbfbabefe1de7107d897c68b81e6b460'
	    'cac9e935b7b5bb216c45fb4df2ddd75d4d8353185189fa763ddaa91025768139')

prepare() {
	cd "$srcdir"
	patch -p0 -Nus -i "$pkgname-$pkgver/$pkgname-$pkgver-GTK3.20.patch" \
	> /dev/null || echo "1" > /dev/null
}

package() {
	cd "$srcdir"
	
	install -d "$pkgdir/usr/share/themes/Greybird Classic"
	install -d "$pkgdir/usr/share/themes/Greybird Compact"
	install -d "$pkgdir/usr/share/themes/Greybird a11y"
	
	cp -rf "Greybird-$pkgver/" "$pkgdir/usr/share/themes/Greybird/"
	rm -rf "$pkgdir/usr/share/themes/Greybird/.gitignore"
	
	ln -s "/usr/share/themes/Greybird/xfwm4-compact" \
	      "$pkgdir/usr/share/themes/Greybird Compact/xfwm4"
	      
	ln -s "/usr/share/themes/Greybird/xfwm4-a11y" \
	      "$pkgdir/usr/share/themes/Greybird a11y/xfwm4"
}
