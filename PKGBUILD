# Maintainer: gardenapple <mailbox at appl garden>

pkgname=ib-en
pkgver=1.0.7
pkgrel=1
pkgdesc='Freeware horror adventure game by kouri (English translation)'
url='https://vgperson.com/games/ib.htm'
arch=('any')
license=('custom:non-free')
depends=('easyrpg-player')
makedepends=('icoutils')
source=('https://vgperson.com/games/Ib107.zip'
        'Ib'
        'Ib-window.desktop'
        'Ib-fullscreen.desktop')
sha512sums=('c2700b87b4e0d25218acbbf922ab705731f9bccfe50deb9b441eeaa9a6d00d78d945a607af09eca463007d497f9f76b75e5ec06f2e76f318d58cb1321652e393'
            '1864653f6d3e11af411a9766ce30dcaf243a0c1f6f4ee8c8c6920279df505801762c6c48e7c7621fb74c1f2015a2f7c500ccf8167d960eb8e44444f2bf1bd8e8'
            '949579741c8f9d1a7a929dadd741c3aa13dea532ff0d30f59088d09a5164a598d023f425e745d452bb0d82022ac6900049edc75153d1a5dbe8252c87711f79f7'
            '58ad7b026a0a28550492c8581fc60b539f8566c2ba9f233bba23823895ffed1a8279b2257fe13ff9c84ccebc001ac099321cfd612f86cae46c5c39f6d2d1cb6b')

package() {
	wrestool --extract --output=icon.ico --type=group_icon StartFullscreen.exe
	mkdir -p "$pkgdir/usr/share/pixmaps"
	icotool --extract --output="$pkgdir/usr/share/pixmaps/Ib.png" icon.ico

	# Does not seem to be required but easyrpg-player complains when this is deleted
	# rm Data/RPG_RT.exe

	mkdir -p "$pkgdir/usr/lib"
	mv Data "$pkgdir/usr/lib/Ib"

	install -Dm644 'Ib Manual.txt' -t "$pkgdir/usr/share/doc/Ib"
	install -Dm644 Ib-*.desktop -t "$pkgdir/usr/share/applications"
	install -Dm755 Ib -t "$pkgdir/usr/bin"
}
