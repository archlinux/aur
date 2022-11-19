# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=clonehero-ptb
pkgver=v1.0.0.3925
pkgrel=1
pkgdesc=\
'Public test build for Clone Hero. Clone Hero is a free rhythm game, which '\
'can be played with any 5 or 6 button guitar controller, game controllers, '\
'or just your standard computer keyboard.'
arch=('x86_64')
url='https://clonehero.net/'
license=('freeware-proprietary')
depends=('gtk2' 'opengl-driver' 'sdl2' 'rsync')
optdepends=('discord: Discord rich presence support')
conflicts=('clonehero')
source=(
	"clonehero-linux_$pkgver.tar.xz::https://pubdl.clonehero.net/ptb/$pkgver-master/clonehero-linux.tar.xz"
	'clonehero.desktop'
	'clonehero.install'
	'clonehero'
)
sha256sums=(
	'52aa4b8afdfd5d6dba84d8b3d080303c360022214290855142295334b827a335'
	'6d6d3e8e08ba65fedcc07a2d4ef8d5f6eabd4aec20dbc7e0febc6d58faff72bf'
	'334fabab9d9ebaf2b4ecea7abaea9b0d1dbcf0626311257e03989251940802ff'
	'67f0a9ff15aae984d481c2eb394d2dc25c0388c0c193352b3f5813e5ea40a6df'
)
install=clonehero.install

# Stripping causes crashes/softlocks at runtime, with the error log complaining
# about corrupted files, so we'll disable it entirely.
options=(!strip)

package() {
	install -Dm644 clonehero.desktop "$pkgdir/usr/share/applications/clonehero.desktop"
	install -Dm755 clonehero "$pkgdir/usr/bin/clonehero"
	cd "$srcdir/clonehero-linux"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/opt/clonehero/{}" \;
	chmod +x "$pkgdir/opt/clonehero/clonehero"
	install -Dm644 'clonehero_Data/Resources/UnityPlayer.png' "$pkgdir/usr/share/pixmaps/clonehero.png"
}
