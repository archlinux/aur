# Maintainer: gardenapple <mailbox at appl garden>

pkgname=off-en
pkgver=3.0.1
pkgrel=1
pkgdesc='A surreal role-playing game'
url='https://off.fandom.com/wiki/Downloads'
arch=('any')
license=('custom:non-free')
depends=('easyrpg-player')
makedepends=('icoutils')
source=("https://github.com/gronoe/off-mac/releases/download/$pkgver/OFF.English.3.0.zip"
        'OFF'
        'OFF.desktop')
sha512sums=('3fdb49a6c8e1a7bf4fcc3ed5ef7dc46caf76b419e139781665a09e23ec04502d1f11d4bc8c878c06a01939af25c4f1b4ec58ce5b0e6ac943e2210eb580cb27ad'
            '464a210723d54a3067536b37f0d428f6a4a48a10f5f219c285d49fbd99671e423d72115e166cc1e9b55d97bf116faccfd5c61a95dc44fcbc70666720ab35ae35'
            '27dd25d04d3170a11a592d8696f14d65e4adcdc616a6d51b8d6c4e4c9daec85abc83e117d65213e8ebf6e3d6092d1b6bea3c4c4aed610cf64d6aaf221c38224d')

package() {
	(
		cd 'OFF English 3.0'

		mkdir -p "$pkgdir/usr/share/pixmaps"
		icotool --extract --output="$pkgdir/usr/share/pixmaps/OFF.png" Picture/icon.ico

		rm -r "bonus folder"
		rm *.dll Sauvegarde_RPG_RT.exe desktop.ini *.txt *.r3proj Save*.lsd
		# Does not seem to be required but easyrpg-player complains when this is deleted
		# rm RPG_RT.exe
	)

	install -Dm644 OFF.desktop -t "$pkgdir/usr/share/applications"
	install -Dm755 OFF -t "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	mv 'OFF English 3.0' "$pkgdir/usr/lib/OFF"
}
