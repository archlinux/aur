# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=vencord-hook
pkgver=1
pkgrel=2
pkgdesc="Pacman hook to automatically install Vencord after Discord updates"
arch=('any')
url="https://github.com/Vencord/Installer.git"
license=('GPL3' 'MIT')
depends=('curl')
source=("vencord.hook"
		"vencord.sh"
		"LICENSE-VENCORD"
		"LICENSE-VENCORD-HOOK")
sha256sums=('d49f2f716890e21828162cf3f75ae0b691e5d91c669e8419419acbbbd4816230'
			'a84bb378734672773eae8d8cc1e6c91f4f45d14f575373c3a753f3bbab4e241b'
			'SKIP'
			'SKIP')

package() {
	install -Dm644 "$srcdir/vencord.hook" "${pkgdir}/etc/pacman.d/hooks/vencord.hook"
	install -Dm755 "$srcdir/vencord.sh" "${pkgdir}/etc/pacman.d/hookbin/vencord.sh"

	install -Dm644 "$srcdir/LICENSE-VENCORD-HOOK" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	install -Dm644 "$srcdir/LICENSE-VENCORD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
}

post_remove() {
	if [[ -f /etc/pacman.d/hookbin/vencord.sh ]]; then
		rm /etc/pacman.d/hookbin/vencord.sh
	fi

	rmdir /etc/pacman.d/hookbin 2>/dev/null || true

	if [[ -f /etc/pacman.d/hooks/vencord.hook ]]; then
		rm /etc/pacman.d/hooks/vencord.hook
	fi

	rm -f "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD-HOOK"
	rm -f "$pkgdir/usr/share/licenses/$pkgname/LICENSE-VENCORD"
	rmdir "$pkgdir/usr/share/licenses/$pkgname" 2>/dev/null || true
}
