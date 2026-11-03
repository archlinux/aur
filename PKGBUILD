# Maintainer: 9M2PJU <9m2pju at gmail dot com>
pkgname=rpi-clone-tui-git
pkgver=2.1.0.r2.g47cd749
pkgrel=1
pkgdesc="Raspberry Pi disk cloner with guided whiptail TUI, progress gauge and CPU/MEM charts"
arch=('any')
url="https://github.com/9M2PJU/rpi-clone"
license=('BSD-3-Clause')
depends=('bash' 'rsync' 'parted' 'util-linux' 'dosfstools' 'libnewt')
makedepends=('git')
provides=('rpi-clone' 'rpi-clone-setup' 'rpi-clone-tui')
conflicts=('rpi-clone' 'rpi-clone-setup' 'rpi-clone-git')
source=("git+https://github.com/9M2PJU/rpi-clone.git")
sha256sums=('SKIP')

pkgver() {
	cd rpi-clone
	git describe --long --tags 2>/dev/null \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd rpi-clone
	install -Dm755 rpi-clone "$pkgdir/usr/bin/rpi-clone"
	install -Dm755 rpi-clone-setup "$pkgdir/usr/bin/rpi-clone-setup"
	install -Dm755 rpi-clone-tui "$pkgdir/usr/bin/rpi-clone-tui"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
