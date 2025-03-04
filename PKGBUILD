# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=vencord-hook
pkgver=1.1
pkgrel=1
pkgdesc="Pacman hook to automatically install Vencord after Discord updates"
arch=('any')
url="https://vencord.dev"
license=('MIT')
depends=('curl')
source=("vencord.hook"
		"vencord.sh")
sha256sums=('d49f2f716890e21828162cf3f75ae0b691e5d91c669e8419419acbbbd4816230'
			'3613ca49a92e739d785650f6c951a967684a01d82af6bfc01fe7bf126276dae1')

package() {
	install -Dm644 vencord.hook "${pkgdir}/etc/pacman.d/hooks/vencord.hook"
	install -d "${pkgdir}/etc/pacman.d/hookbin"
	install -Dm755 vencord.sh "${pkgdir}/etc/pacman.d/hookbin/vencord.sh"
}

post_remove() {
	if [[ -f /etc/pacman.d/hookbin/vencord.sh ]]; then
		rm /etc/pacman.d/hookbin/vencord.sh
	fi

	rmdir /etc/pacman.d/hookbin 2>/dev/null || true

	if [[ -f /etc/pacman.d/hooks/vencord.hook ]]; then
		rm /etc/pacman.d/hooks/vencord.hook
	fi
}
