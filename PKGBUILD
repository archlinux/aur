# Maintainer: Aron Young <tkf6fkt at gmail dot com>

pkgname=flashbrowser-bin
pkgver=0.7
pkgrel=1
pkgdesc="A browser dedicating to supporting adobe flash."
arch=(x86_64 aarch64)
url="https://flash.pm/browser/"
license=('unknown')
depends=(electron9 nodejs bash)
provides=(flashbrowser)
conflicts=(flashbrowser-git)
source=(
	"https://github.com/radubirsan/FlashBrowser/releases/download/v${pkgver}/FlashBrowser-linux-x64.zip"
	$pkgname.desktop
)
sha256sums=('0c649e024c64232401bfab316165d2bc8bda7fc997efdbbb03ba3d09a61054d6'
            'a1cb0b08ad091248636a77c57148e8d80ec097d06ae3ae660ba508b74fea027d')

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av $srcdir/*/resources/app $pkgdir/opt/$pkgname/
	echo -e "#!/bin/bash\nelectron9 /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	install -Dm 644 $pkgname.desktop -t $pkgdir/usr/share/applications/
	find . -type f -name "icon.ico" -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
}
