# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=clonehero-ptb
pkgver=v1.0.0.3805
pkgrel=3
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
	'2f93e014817284ee0456eda49fa73579ef848c8bdfb8e069f335e022aa1e13d9'
	'6d6d3e8e08ba65fedcc07a2d4ef8d5f6eabd4aec20dbc7e0febc6d58faff72bf'
	'cd5f6a9ae2dd74f845d9cd5f1e5a4d2f95de661d4ce29ba8fb0d4231c97ef8e3'
	'2aff1db59fb7aaadbad80675271f2bcfff8ddf873d69815c242333a0dd4d1fba'
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
