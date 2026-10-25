# Contributor: WinnerWind <contact@winnerwind.in>

pkgname=bakkuappu-git
pkgdesc='No BS python based backup script and scheduler.'
pkgver=r21.583ccb4
pkgrel=2
arch=(any)
url='https://git.winnerwind.in/WinnerWind/bakkuappu'
license=(LicenseRef-None)
depends=('python' 'python-yaml' 'rclone' 'tar')
makedepends=('git')
source=(git+https://git.winnerwind.in/WinnerWind/bakkuappu.git)
sha256sums=('SKIP')
backup=('etc/bakkuappu.yaml')

conflicts=('bakkuappu')
provides=('bakkuappu')

pkgver() {
	cd "${srcdir}/bakkuappu"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/bakkuappu"
	install -Dm755 bakkuappu.py "${pkgdir}/usr/bin/bakkuappu"
	install -Dm644 config.yaml \
		"${pkgdir}/etc/bakkuappu.yaml"
	install -Dm644 bakkuappu.service "${pkgdir}/usr/lib/systemd/system/bakkuappu.service"
}

