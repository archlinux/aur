# Maintainer: MiguVT <cuentas@miguvt.com>

pkgname=fixvr-git
pkgver=r1.23ebaa1
pkgrel=1
pkgdesc="udev rule that fixes the Valve Index blank EDID (640×480) bug on Linux"
arch=('any')
url="https://github.com/MiguVT/fixvr"
license=('MIT')
makedepends=('git')
provides=('fixvr')
conflicts=('fixvr')
install=fixvr.install
source=("$pkgname::git+https://github.com/MiguVT/fixvr.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"

	# udev rule — installed under /usr/lib so pacman owns it cleanly;
	# /etc/udev/rules.d/ is reserved for local admin overrides.
	install -Dm644 src/99-valve-index-reboot.rules \
		"$pkgdir/usr/lib/udev/rules.d/99-valve-index-reboot.rules"

	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Install the upstream README as documentation.
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
}
