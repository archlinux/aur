# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
_pkgname=$pkgname-src
pkgver=1.6.1.2
pkgrel=1
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=('ultracopier')
source=("http://files.first-world.info/$pkgname/$pkgver/$_pkgname-$pkgver.tar.xz"
        "ultracopier.desktop"
)
sha512sums=('cb3904d89c8211a25e315819a32cb7b61e892770f1421c2fb8bb60eb535c71837b96147fb651fa737bcb3692a335288ae0e6c8912a364b4c06ffc178de020d9c'
            '76fa620b2f42bec3b127c8cc02564e9b3aee75d94267cef717f1f752802c4092b45897603451aab5a8d65f76392ef36818bfceea427527ebd90334f2fa520fab')

prepare() {
	cd "$srcdir/$_pkgname"
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_DEBUG/\/\/#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG/\/\/#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/\/\/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$_pkgname"
	qmake ultracopier.pro
	make
}

package() {
	install -d "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$_pkgname/ultracopier" "$pkgdir/usr/bin/ultracopier"

	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/ultracopier.desktop" "$pkgdir/usr/share/applications/ultracopier.desktop"
   
	install -d "$pkgdir/usr/share/pixmaps"
	install -Dm644 "$srcdir/$_pkgname/resources/ultracopier-128x128.png" "$pkgdir/usr/share/pixmaps/ultracopier.png"
}

