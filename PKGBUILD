# Maintainer: Ivy Foster <code@escondida.tk>
# Reference: PKGBUILD(5)

pkgname=physlock
pkgver=13
pkgrel=1
pkgdesc='Lightweight Linux console locking tool'
url='https://github.com/muennich/physlock'
license=(GPL2)

depends=(pam)
optdepends=('xss-lock: lock screen on suspend or after inactivity')

arch=(x86_64)
# physlock.pam: see https://bugs.archlinux.org/index.php?do=details&task_id=61300
source=(
	"physlock-$pkgver.tar.gz::https://github.com/muennich/physlock/archive/v$pkgver.tar.gz"
	physlock.pam
)
# sha256sums provided by packager; grains of salt advised
sha256sums=(
	9ae4716a1e916f141e47a01b439133ca382281ebdcbec1e53f85da6771774bd6
	de66118684a2ecec18017dd96e50a489f30465510250c007ced16f81fb542ba5
)

build() {
	make PREFIX=/usr -C "physlock-$pkgver"
}

package() {
	install -D -m 644 physlock.pam "$pkgdir/etc/pam.d/physlock"
	make PREFIX=/usr "DESTDIR=$pkgdir" -C "physlock-$pkgver" install
}
