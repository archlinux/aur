# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=clonehero-ptb
pkgver=v1.0.0.3747
pkgrel=1
pkgdesc=\
'Public test build for Clone Hero. Clone Hero is a free rhythm game, which '\
'can be played with any 5 or 6 button guitar controller, game controllers, '\
'or just your standard computer keyboard.'
arch=('x86_64')
url='https://clonehero.net/'
license=('freeware-proprietary')
depends=('gtk2' 'opengl-driver' 'sdl2')
optdepends=('discord: Discord rich presence support')
conflicts=('clonehero')
source=(
	"clonehero-linux_$pkgver.tar.xz::https://pubdl.clonehero.net/ptb/$pkgver-master/clonehero-linux.tar.xz"
	'clonehero.desktop'
	'clonehero.install'
	'clonehero'
)
sha256sums=(
	'05f501d0caa03d26fb6397b6afa5f52fd10575fb714e33f1e854dc2d17472eff'
	'6d6d3e8e08ba65fedcc07a2d4ef8d5f6eabd4aec20dbc7e0febc6d58faff72bf'
	'a2a4829d71d91d106a9c756d6323bfbf505e2757c83abba199a661728dccde9a'
	'c15846bf8deb9089c1d0c600ab1d53aecaae0f054c308626d2c1038935f38ad1'
)
install=clonehero.install

package() {
	install -Dm644 clonehero.desktop "$pkgdir/usr/share/applications/clonehero.desktop"
	install -Dm755 clonehero "$pkgdir/usr/bin/clonehero"
	cd "$srcdir/clonehero-linux" || exit 1
	find . -type f -exec install -Dm644 "{}" "$pkgdir/opt/clonehero/{}" \;
	chmod +x "$pkgdir/opt/clonehero/clonehero"
	install -Dm644 'clonehero_Data/Resources/UnityPlayer.png' "$pkgdir/usr/share/pixmaps/clonehero.png"
}
