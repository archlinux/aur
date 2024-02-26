# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=sonic3air-bin
pkgver=v24.02.02.0
pkgrel=0
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
arch=('x86_64')
url='https://sonic3air.org/'
license=('custom:CC BY-NC-SA 4.0')
depends=('opengl-driver' 'sdl2')
optdepends=('discord: Discord rich presence support')
provides=(sonic3air)
source=(
	"sonic3air_${pkgver}.tar.gz::https://github.com/Eukaryot/sonic3air/releases/download/$pkgver-stable/sonic3air_game.tar.gz"
	'sonic3air.desktop'
	'sonic3air.sh'
	'LICENSE.md'
)

sha256sums=(
	'45e97c48513a7b466f5c55e766abad49c859ba0c7334f570da7cba2f5b143469'
	'7c5568d01131935c189b3060ea0319cc0047c8a76c9152bf5d461e70f676eebd'
	'0ac3f4ea42157e6956f85e1e68e7bd456104fd264d10dd2be43e4c38421b3426'
	'4bff643c05c2396b7e2987721c2f77cd3921434a0a2511f4a3bf31fc53fd7d76'
)

package() {
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sonic3air/LICENSE.md"
	install -Dm644 sonic3air.desktop "$pkgdir/usr/share/applications/sonic3air.desktop"
	install -Dm755 sonic3air.sh "$pkgdir/usr/bin/sonic3air"
	cd "$srcdir/sonic3air_game/" || exit 1
	rm "setup_linux.sh"
	find . -type f -exec install -D {} "$pkgdir/opt/sonic3air/{}" \;
}
