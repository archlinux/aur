# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=clonehero-ptb
pkgver=v1.0.0.4080
pkgrel=2
pkgdesc=\
'Clone Hero is a free rhythm game, which can be played with any 5 or 6 button '\
'guitar controller, game controllers, or just your standard computer keyboard.'
arch=('x86_64')
url='https://clonehero.net/'
license=('freeware-proprietary')
depends=('gtk2' 'opengl-driver' 'sdl2')
optdepends=(
	'discord: Discord rich presence support'
	'vulkan-driver: Vulkan graphics mode'
	'pulseaudio-alsa: Sound output via PulseAudio/PipeWire'
)
conflicts=('clonehero')
source=(
	"clonehero-linux_$pkgver.tar.xz::https://pubdl.clonehero.net/clonehero-$pkgver-final/clonehero-linux.tar.xz"
	'clonehero.desktop'
	'clonehero.install'
	'clonehero'
)
sha256sums=(
	'6162d5fb0810f517ca45249687fc743cc8c1ead140e18a476fd5ad60e3a06592'
	'6d6d3e8e08ba65fedcc07a2d4ef8d5f6eabd4aec20dbc7e0febc6d58faff72bf'
	'ed18ad9cc13b7a4b9b15a68ed9d2e0cb0a689bb85fecc33307b1c6da3ef1bbc0'
	'e152f18dc38f47c0b0c52ff4227c7daa2fa5251fdf7f86683df1cd8274b24cb6'
)
install=clonehero.install

# Stripping causes crashes/softlocks at runtime, with the error log complaining
# about corrupted files, so we'll disable it entirely.
options=(!strip)

package() {
	install -Dm644 clonehero.desktop "$pkgdir/usr/share/applications/clonehero.desktop"
	install -Dm755 clonehero "$pkgdir/usr/bin/clonehero"
	cd "$srcdir/clonehero-linux" || exit 1
	find . -type f -exec install -Dm644 '{}' "$pkgdir/opt/clonehero/{}" \;
	chmod +x "$pkgdir/opt/clonehero/clonehero"
	install -Dm644 'clonehero_Data/Resources/UnityPlayer.png' "$pkgdir/usr/share/pixmaps/clonehero.png"
}
