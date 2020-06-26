# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=viper4linux-gui
pkgver=2.1
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=('x86_64')
url="https://github.com/Audio4Linux/Viper4Linux-GUI"
license=('GPL3')
depends=('viper4linux' 'qt5-svg' 'qt5-multimedia' 'mesa')
optdepends=('libappindicator-gtk3: tray icon support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
		"viper4linux-gui.desktop")
sha256sums=('bb4534565d8d71307b878b90c9066a39685c59bfbde8b71c07d47db7c03b24ee'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

build() {
	cd "Viper4Linux-GUI-$pkgver"
	qmake
	make PREFIX=/usr
}

package() {
	cd "Viper4Linux-GUI-$pkgver"
	install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
