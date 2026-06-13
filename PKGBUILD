# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=guiffy-bin
pkgver=12.4
pkgrel=1
pkgdesc='Visual file compare diff tool, merge tool, and folder compare tool'
arch=('x86_64')
url='https://www.guiffy.com/'
license=('custom')
depends=('java-runtime')
makedepends=('unzip')
provides=("guiffy=${pkgver}")
conflicts=('guiffy')
options=('!strip')
source=("https://www.guiffy.com/download/Linux/NoVM/Guiffy-$pkgver-linux-x64-installer.run"
        'local://guiffy.desktop')
sha256sums=('46078391704648e454e228090a48b50353e4f80824f11b3ad04d2c96f09aa6e0'
            'SKIP')

package() {
	chmod +x "Guiffy-$pkgver-linux-x64-installer.run"
	./Guiffy-$pkgver-linux-x64-installer.run --mode unattended --prefix "$pkgdir/opt/guiffy"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/guiffy/guiffy "$pkgdir/usr/bin/guiffy"

	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
	unzip -p "$pkgdir/opt/guiffy/Guiffy.jar" com/guiffy/guiffy/images/GBOX32.png > "$pkgdir/usr/share/icons/hicolor/32x32/apps/guiffy.png"

	mkdir -p "$pkgdir/usr/share/applications"
	cp guiffy.desktop "$pkgdir/usr/share/applications"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /opt/guiffy/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
