# Maintainer: Drommer <drommer@github.com>

pkgbase=sweet-theme-nova-git
pkgname=(sweet-gtk-theme-nova-git sweet-kde-theme-nova-git kvantum-theme-sweet-nova-git sweet-cursor-theme-git)
_pkgname=sweet
pkgver=r218.741c4f3
pkgrel=1
pkgdesc="Colorful Sweet GTK and KDE theme"
arch=('any')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sweet-gtk-theme-nova-git() {
	provides=('sweet-gtk-theme-nova')
	conflicts=('sweet-theme' 'sweet-theme-dark' 'sweet-theme-git')
	pkgdesc="Light and dark colorful GTK theme (Sweet Nova)"
	optdepends=('candy-icons-git: Icon theme'
							'sweet-cursor-theme: Cursor theme')
	cd $_pkgname
	install -d $pkgdir/usr/share/themes/Sweet
	mv assets cinnamon gnome-shell gtk-2.0 gtk-3.0 gtk-4.0 metacity-1 xfwm4 index.theme "$pkgdir/usr/share/themes/Sweet"
	find "$pkgdir/usr/share/themes/Sweet" -name "*.scss" -exec rm -f {} \;
	rm $pkgdir/usr/share/themes/Sweet/{cinnamon/thumbnail.png,gtk-2.0/{assets{.svg,.txt},links.fish,render-assets.sh}}
}

package_sweet-kde-theme-nova-git() {
	provides=('sweet-kde-theme-nova')
	conflicts=('aurorae-theme-sweet' 'color-scheme-sweet' 'konsole-colorscheme-sweet' 'sddm-theme-sweet' 'sweet-kde')
	pkgdesc="Dark colorful KDE theme (Sweet Nova)"
	optdepends=('sweet-gtk-theme-nova: GTK theme'
							'plasma5-theme-sweet: KDE Plasma 5 theme'
							'kvantum-theme-sweet-nova: Kvantum theme'
							'candy-icons-git: Icon theme'
							'sweet-cursor-theme: Cursor theme')
	cd $_pkgname/kde
	install -d $pkgdir/usr/share/{aurorae/themes,color-schemes,plasma/look-and-feel/com.github.eliverlara.sweet,sddm/themes/sweet}
	mv aurorae/* "$pkgdir/usr/share/aurorae/themes"
	mv colorschemes/Sweet.colors "$pkgdir/usr/share/color-schemes"
	mv konsole "$pkgdir/usr/share"
	mv look-and-feel/* "$pkgdir/usr/share/plasma/look-and-feel/com.github.eliverlara.sweet"
	mv sddm/* "$pkgdir/usr/share/sddm/themes/sweet"
}

package_kvantum-theme-sweet-nova-git() {
	provides=('kvantum-theme-sweet-nova')
	conflicts=('kvantum-theme-sweet')
	pkgdesc="Sweet Nova theme for Kvantum"
	depends=(kvantum-qt5)
	cd $_pkgname/kde
	install -d $pkgdir/usr/share/Kvantum/Sweet
	mv Kvantum/* "$pkgdir/usr/share/Kvantum/Sweet"
}

package_sweet-cursor-theme-git() {
	provides=('sweet-cursor-theme')
	conflicts=('xcursor-sweet')
	pkgdesc="Sweet cursor theme"
	cd $_pkgname/kde
	install -d $pkgdir/usr/share/icons
	mv cursors/Sweet-cursors "$pkgdir/usr/share/icons"
}
