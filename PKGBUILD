# Maintainer: Jim Philip <jimphilip394 at gmail dot com>
pkgname=vencord-hook
pkgver=1
pkgrel=24
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
            'a23ab1cdd3aae94eead3728291d9f7e1b34051a9dbf4d5691257a4eddb237bd5'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'fa1a4dd7113304dce99f33615dca6f796dec5be6b48efb1d7a7160e726a619a5')
install="vencord-hook.install"

package() {
	hook_file="$srcdir/vencord-hook.hook"
	if pacman -Qi pacman | grep -qi CachyOS; then
		hook_file="$srcdir/vencord-hook-cachyos.hook"
	fi
	install -Dm644 "$hook_file" "$pkgdir/etc/pacman.d/hooks/vencord-hook.hook"

	install -Dm755 "$srcdir/vencord-hook.sh" "$pkgdir/etc/pacman.d/hooks.bin/vencord-hook.sh"

	install -Dm644 "$srcdir/LICENSE-VENCORD-HOOK" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	install -Dm644 "$srcdir/LICENSE-VENCORD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
}
