# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=sonic3air-bin
pkgver=v24.02.02.1
pkgrel=1
scriptver=1.0.0
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
arch=('x86_64')
url='https://sonic3air.org/'
license=('custom:CC BY-NC-SA 4.0')
depends=('opengl-driver' 'sdl2')
optdepends=('discord: Discord rich presence support')
provides=(sonic3air)
source=(
	"sonic3air_$pkgver.tar.gz::https://github.com/Eukaryot/sonic3air/releases/download/v24.02.02.0-stable/sonic3air_game.tar.gz"
	"https://gitlab.com/linuxbombay/sonic3air/-/archive/$scriptver/sonic3air-$scriptver.tar.bz2"
	"LICENSE.md"
)

sha256sums=('502c4ca9d5cb52db4a25b860b1003949d9ae0697f37f6368098346e67654bb16'
            'bcde481e0dce927555480adf48fdcb340170034f93218d34788c2ecb8d5992b0'
            '4bff643c05c2396b7e2987721c2f77cd3921434a0a2511f4a3bf31fc53fd7d76')

package() {
        install -dm755 "$pkgdir/usr/share/games/Sonic3Air"
        install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air.png" "$pkgdir/usr/share/pixmaps/sonic3air.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sonic3air/LICENSE.md"
	install -Dm644 "$srcdir/sonic3air-$scriptver/sonic3air.desktop" "$pkgdir/usr/share/applications/sonic3air.desktop"
	install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air" "$pkgdir/usr/bin/sonic3air"
	
	chmod -R 775 "$srcdir/sonic3air_game"
	mkdir -p "$pkgdir/usr/share/games/Sonic3Air/data" "$pkgdir/usr/share/games/Sonic3Air/bonus" "$pkgdir/usr/share/games/Sonic3Air/doc"
	cp -r "$srcdir/sonic3air_game/data"/* "$pkgdir/usr/share/games/Sonic3Air/data"
	cp -r "$srcdir/sonic3air_game/bonus"/* "$pkgdir/usr/share/games/Sonic3Air/bonus"
	cp -r "$srcdir/sonic3air_game/doc"/* "$pkgdir/usr/share/games/Sonic3Air/doc"
	cp -r "$srcdir/sonic3air_game/config.json" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air_game/Manual.pdf" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air-$scriptver/sonic3air.png" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air_game/sonic3air_linux" "$pkgdir/usr/share/games/Sonic3Air/sonic3air"
	find "$srcdir/sonic3air_game" -type f -name "*.so" -exec cp {} "$pkgdir/usr/share/games/Sonic3Air" \;
}
