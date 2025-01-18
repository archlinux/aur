# Maintainer: Corey Bruce <cdfrosty at gmail dot com>

pkgname=sonic3air-bin
pkgver=v24.02.02.1
pkgrel=3
scriptver=1.0.1
arm64libver=1.0.0
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
arch=('x86_64' 'aarch64')
url='https://sonic3air.org/'
license=('GPL 3.0')
depends=('opengl-driver' 'sdl2' 'zenity' 'yad')
depends_aarch64=('box64')
optdepends=('discord: Discord rich presence support')
provides=(sonic3air)
source=(
	"sonic3air_$pkgver.tar.gz::https://github.com/Eukaryot/sonic3air/releases/download/v24.02.02.0-stable/sonic3air_game.tar.gz"
	"https://gitlab.com/linuxbombay/sonic3air/sonic3air/-/archive/$scriptver/sonic3air-$scriptver.tar.bz2"
	"LICENSE.md"
	)
source_aarch64=("https://gitlab.com/linuxbombay/sonic3air-new/libs/$arm64libver/-/raw/main/Sonic3Airx64-libs-$arm64libver.tar.xz")	

sha256sums=('502c4ca9d5cb52db4a25b860b1003949d9ae0697f37f6368098346e67654bb16'
            '16841df3d1170267b1dd3d700c252679fdc872395a7a826485335ece9ab36af1'
            '4bff643c05c2396b7e2987721c2f77cd3921434a0a2511f4a3bf31fc53fd7d76')
sha256sums_aarch64=('fd2bfcf387dc4ad824f9fbeb369393f18885a5a42ce3ff12f330336f441aa017')

package() {
        install -dm755 "$pkgdir/usr/share/games/Sonic3Air"
        install -dm755 "$pkgdir/usr/lib"
        install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air.png" "$pkgdir/usr/share/pixmaps/sonic3air.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sonic3air/LICENSE.md"
	install -Dm644 "$srcdir/sonic3air-$scriptver/sonic3air.desktop" "$pkgdir/usr/share/applications/sonic3air.desktop"
	install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air" "$pkgdir/usr/bin/sonic3air"
	
	mkdir -p "$pkgdir/usr/share/games/Sonic3Air/data" "$pkgdir/usr/share/games/Sonic3Air/bonus" "$pkgdir/usr/share/games/Sonic3Air/doc"
	cp -r "$srcdir/sonic3air_game/data"/* "$pkgdir/usr/share/games/Sonic3Air/data"
	cp -r "$srcdir/sonic3air_game/bonus"/* "$pkgdir/usr/share/games/Sonic3Air/bonus"
	cp -r "$srcdir/sonic3air_game/doc"/* "$pkgdir/usr/share/games/Sonic3Air/doc"
	cp -r "$srcdir/sonic3air_game/config.json" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air_game/Manual.pdf" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air-$scriptver/sonic3air.png" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air_game/sonic3air_linux" "$pkgdir/usr/share/games/Sonic3Air/sonic3air"
	find "$srcdir/sonic3air_game" -type f -name "*.so" -exec cp {} "$pkgdir/usr/share/games/Sonic3Air" \;
	#x64 libs for Arm64
	find "$srcdir" -type f -name "*.so.*" -exec cp -r {} "$pkgdir/usr/share/games/Sonic3Air" \;
	ln -s "$pkgdir/usr/share/games/Sonic3Air/libstdc++.so.6.0.33" "$pkgdir/usr/share/games/Sonic3Air/libstdc++.so.6"
}
