# Maintainer: Bruce Zhang <bruceutut@aur>
pkgname=dolphin-quick-view
pkgver=1.2.7
pkgrel=1
pkgdesc="Simple program to have a quick preview of the files in a folder (similar to Apple's Quick Look)"
arch=('any')
url="https://github.com/Nyre221/dolphin-quick-view"
license=('GPL')
depends=(python-pyqt5 python-poppler-qt5 dolphin dbus qt5-tools)
optdepends=(
	'libreoffice: for odt,csv,doc,docx support'
)
source=("https://github.com/Nyre221/dolphin-quick-view/releases/download/v$pkgver/quick_view_package.tar.gz")
sha256sums=('9d1a7580768b04216727b4f99aeaf9f624187f4eba3e4c533f7f09df91746924')

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
