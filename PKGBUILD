# Maintainer: Bruce Zhang <bruceutut@aur>
pkgname=dolphin-quick-view
pkgver=1.2.7
pkgrel=2
pkgdesc="Simple program to have a quick preview of the files in a folder (similar to Apple's Quick Look)"
arch=('any')
url="https://github.com/Nyre221/dolphin-quick-view"
license=('GPL')
depends=(pyside6 xclip wl-clipboard)
optdepends=(
	'libreoffice: for odt,csv,doc,docx support'
)
source=("https://github.com/Nyre221/dolphin-quick-view/releases/download/v$pkgver(Qt6)/quick_view_package.tar.gz")
sha256sums=('485ed1270f37b903ad3139fb602e48c00c4d2799f46652f08b95b5d2129a5efd')

build() {
	cd "$srcdir/quick_view_package"
	# normalize paths
	sed -i 's/~\/.config\/quick_view\//\/usr\/share\/dolphin-quick-view\//g' dolphin_quick_view_shortcut.sh
	sed -i 's/$HOME\/.config\/quick_view\//\/usr\/share\/dolphin-quick-view\//g' quick_view.desktop
	chmod +x dolphin_quick_view_shortcut.sh
	chmod +x quick_view.pyz
}

package() {
	cd "$srcdir/quick_view_package"
	mkdir -p "$pkgdir/usr/share/$pkgname/"
	cp -v {quick_view.pyz,dolphin_quick_view_shortcut.sh} "$pkgdir/usr/share/$pkgname/"
	mkdir -p "$pkgdir/usr/share/kservices5/ServiceMenus/"
	cp -v quick_view.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/"
}
