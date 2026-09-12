# Maintainer: Vedran Hrabar <vedran.hrabar@outlook.com>

pkgname=bt-dualboot-sync
pkgver=0.1.3
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
sha256sums=('46da5d6b55538b00a2930c74bc085b7792b8d622c34e5b21b772f6b74e3b9aa0')

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
