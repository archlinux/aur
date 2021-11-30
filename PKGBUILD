# Maintainer: Drommer <drommer@github.com>

pkgbase=sweet-theme-mars-git
pkgname=(sweet-gtk-theme-mars-git sweet-kde-theme-mars-git kvantum-theme-sweet-mars-git)
_pkgname=sweet
pkgver=r176.b273e43
pkgrel=1
pkgdesc="Colorful Sweet Mars GTK and KDE theme"
arch=('any')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
source=("git+$url.git#branch=mars")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sweet-gtk-theme-mars-git() {
	provides=('sweet-gtk-theme-mars')
	conflicts=('sweet-theme-mars')
	pkgdesc="Light and dark colorful GTK theme (Sweet Mars)"
	optdepends=('candy-icons-git: Icon theme'
							'sweet-cursor-theme: Cursor theme')
	cd $_pkgname
	install -d $pkgdir/usr/share/themes/Sweet-Mars
	mv assets cinnamon gnome-shell gtk-2.0 gtk-3.0 metacity-1 xfwm4 index.theme "$pkgdir/usr/share/themes/Sweet-Mars"
	find "$pkgdir/usr/share/themes/Sweet-Mars" -name "*.scss" -exec rm -f {} \;
	rm $pkgdir/usr/share/themes/Sweet-Mars/{cinnamon/thumbnail.png,gtk-2.0/{assets{.svg,.txt},links.fish,render-assets.sh}}
}

package_sweet-kde-theme-mars-git() {
	provides=('sweet-kde-theme-mars')
	conflicts=('aurorae-theme-sweet-mars' 'color-scheme-sweet-mars' 'plasma-theme-sweet-mars' 'sweet-mars-kde')
	pkgdesc="Dark colorful KDE theme (Sweet Mars)"
	depends=('plasma-desktop')
	optdepends=('sweet-gtk-theme-mars: GTK theme'
							'kvantum-theme-sweet-mars: Kvantum theme'
							'candy-icons-git: Icon theme'
							'sweet-cursor-theme: Cursor theme')
	cd $_pkgname/kde
	install -d $pkgdir/usr/share/{aurorae/themes,color-schemes,plasma/{desktoptheme/sweet-mars,look-and-feel/com.github.eliverlara.sweet.mars},sddm/themes/sweet-mars}
	mv aurorae/* "$pkgdir/usr/share/aurorae/themes"
	mv colorschemes/Sweet-Mars.colors "$pkgdir/usr/share/color-schemes"
	mv konsole "$pkgdir/usr/share"
	mv plasma/desktoptheme/Sweet-mars/* "$pkgdir/usr/share/plasma/desktoptheme/sweet-mars"
	mv plasma/look-and-feel/Sweet-Mars/* "$pkgdir/usr/share/plasma/look-and-feel/com.github.eliverlara.sweet.mars"
	mv sddm/Sweet-Mars/* "$pkgdir/usr/share/sddm/themes/sweet-mars"
}

package_kvantum-theme-sweet-mars-git() {
	provides=('kvantum-theme-sweet-mars')
	pkgdesc="Sweet Mars theme for Kvantum"
	depends=(kvantum-qt5)
	cd $_pkgname/kde
	install -d $pkgdir/usr/share/Kvantum/Sweet-Mars
	mv kvantum/* "$pkgdir/usr/share/Kvantum/Sweet-Mars"
}
