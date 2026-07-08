# Maintainer: Jim Philip <jimphilip394 at gmail dot com>
pkgname=vencord-hook
pkgver=1
pkgrel=21
pkgdesc="Pacman hook to automatically install Vencord after Discord updates"
arch=('any')
url="https://github.com/Vencord/Installer.git"
license=('GPL3' 'MIT')
depends=('bash' 'awk' 'procps-ng' 'vencord-installer')
source=("vencord-hook.hook"
		"vencord-hook-cachyos.hook"
		"vencord-hook.sh"
		"LICENSE-VENCORD"
		"LICENSE-VENCORD-HOOK")
sha256sums=('17e967e27e4d8df00e0721d429c88680abb61f06cabdf6425137172ec998ae3c'
			'83be97d8f5175276b2f74ed0327185c1f5fe097c94c7cce6fbff83d48ccba200'
			'87ace21becc3e90808b85976569464c07991f63dfa89cf7e8aeddae0203350b0'
			'SKIP'
			'SKIP')
install="vencord-hook.install"

package() {
	HOOK_OUTPUT="$pkgdir/etc/pacman.d/hooks/vencord-hook.hook"
	if grep -qi CachyOS /etc/os-release; then
		install -Dm644 "$srcdir/vencord-hook-cachyos.hook" "$HOOK_OUTPUT"
	else
		install -Dm644 "$srcdir/vencord-hook.hook" "$HOOK_OUTPUT"
	fi

	install -Dm755 "$srcdir/vencord-hook.sh" "$pkgdir/etc/pacman.d/hooks.bin/vencord-hook.sh"

	install -Dm644 "$srcdir/LICENSE-VENCORD-HOOK" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	install -Dm644 "$srcdir/LICENSE-VENCORD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
}
