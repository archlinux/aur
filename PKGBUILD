# Maintainer: gardenapple <mailbox at appl garden>

pkgname=off-en
pkgver=3.0.1
pkgrel=3
pkgdesc='A surreal role-playing game (English translation)'
url='https://off.fandom.com/wiki/Downloads'
arch=('any')
license=('LicenseRef-Freeware')
depends=('easyrpg-player')
source=("https://github.com/gronoe/off-mac/releases/download/$pkgver/OFF.English.3.0.zip"
        'OFF'
        'OFF.desktop'
        'OFF.png')
sha512sums=('3fdb49a6c8e1a7bf4fcc3ed5ef7dc46caf76b419e139781665a09e23ec04502d1f11d4bc8c878c06a01939af25c4f1b4ec58ce5b0e6ac943e2210eb580cb27ad'
            '86c9aa47ca3149342201b8578d1c001073e9080e10c7c0277794f1b14b81d67586e40133a3c03b62c9528b6695ba1b91143d49ab81e1034747a71746ba44b944'
            '27dd25d04d3170a11a592d8696f14d65e4adcdc616a6d51b8d6c4e4c9daec85abc83e117d65213e8ebf6e3d6092d1b6bea3c4c4aed610cf64d6aaf221c38224d'
            '580388e6d54f695a176d6dfa3b455aab5d2ae03c495e2eed3d720baaf41ab60af9cec8be71764e222dc0eec9b6fe70ccc5d171ec07e7fbf19396a06309c5f149')

package() {
	(
		cd 'OFF English 3.0'

		mkdir -p "$pkgdir/usr/share/doc/OFF"
		mv 'translation special thanks.txt' "$pkgdir/usr/share/doc/OFF"
		printf 'Note: the Program INSTRUCTIONS section is not relevant on Linux.\n\n' > "$pkgdir/usr/share/doc/OFF/README.txt"
		cat 'READ ME.txt' >> "$pkgdir/usr/share/doc/OFF/README.txt"
		rm -r 'bonus folder'
		rm .dropbox *.dll Sauvegarde_RPG_RT.exe desktop.ini 'READ ME.txt' *.r3proj Save*.lsd
		# Does not seem to be required but easyrpg-player complains when this is deleted
		# rm RPG_RT.exe
	)

	install -Dm755 OFF -t "$pkgdir/usr/bin"
	install -Dm644 OFF.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 OFF.png -t "$pkgdir/usr/share/pixmaps"
	mkdir -p "$pkgdir/usr/lib"
	mv 'OFF English 3.0' "$pkgdir/usr/lib/OFF"
}
