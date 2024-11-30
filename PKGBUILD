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
sha256sums=('da560df0c33a4b61f0c2ecf146ae80bd91368d16300e66b9d39589f7481bca76'
			'7502de11bbeeb33aec7babb89476ae3d68cc01c0e2caa33fb681f39c0e4cb271')

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