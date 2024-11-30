# Maintainer: WitheringAway <124115470+notwithering@users.noreply.github.com>
pkgname=vencord-hook
pkgver=1.0
pkgrel=1
pkgdesc="Pacman hook to automatically install Vencord after Discord updates"
arch=('any')
url="https://vencord.dev"
license=('MIT')
depends=('curl')
source=("vencord.hook"
		"vencord.sh")
sha256sums=('d9207be523421dd747e99f4e618673338cb657fb96bc53eec1323c56ee7d7814'
			'35e23a2c9ae728922ff572bb2f0be374179c99f98e1c44744c346d53f325957a')

package() {
	install -Dm644 vencord.hook "${pkgdir}/etc/pacman.d/hooks/vencord.hook"
	install -d "${pkgdir}/etc/pacman.d/hookbin"
	install -Dm755 vencord.sh "${pkgdir}/etc/pacman.d/hookbin/vencord.sh"
}

post_remove() {
	if [[ -f /etc/pacman.d/hookbin/vencord.sh ]]; then
		rm /etc/pacman.d/hookbin/vencord.sh
	fi

	# Cleanup is the directory is unused
	rmdir /etc/pacman.d/hookbin 2>/dev/null || true

	if [[ -f /etc/pacman.d/hooks/vencord.hook ]]; then
		rm /etc/pacman.d/hooks/vencord.hook
	fi
}