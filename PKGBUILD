# Maintainer: Vedran Hrabar <vedran.hrabar@outlook.com>

pkgname=bt-dualboot-sync
pkgver=0.1.5
pkgrel=1
pkgdesc="Sync Bluetooth pairing keys from Linux to Windows on a dualboot machine"
arch=('any')
url="https://github.com/vhrabar/bt-dualboot"
license=('MIT')
depends=('python' 'chntpw')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
# bt-dualboot (upstream x2es) and bt-dualboot-ng both install /usr/bin/bt-dualboot
# from their wheel's entry point, so only one of the three can be installed.
provides=('bt-dualboot')
conflicts=('bt-dualboot' 'bt-dualboot-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('587610f66c0178866a32c315df2f75558e1a6647affac94606ea9a753c685175')

_srcname="bt-dualboot-$pkgver"

build() {
	cd "$_srcname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 packaging/bt-dualboot.1 "$pkgdir/usr/share/man/man1/bt-dualboot.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
