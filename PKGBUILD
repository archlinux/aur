# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=greaseweazle
pkgver=1.7
pkgrel=1
epoch=
pkgdesc="Tools for accessing a floppy drive at the raw flux level"
arch=('x86_64')
url="https://github.com/keirf/greaseweazle"
license=('Unlicense')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
depends=('python' 'python-crcmod' 'python-bitarray' 'python-pyserial' 'python-requests')
optdepends=('capsimage: Read IPF files')
source=("https://github.com/keirf/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.zip")
sha256sums=('b2f88c0e8832679ffbc175dc056ad0b06d81f67878d2a19c95673c175d9af56e')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 scripts/49-greaseweazle.rules "$pkgdir/usr/lib/udev/rules/49-greaseweazle.rules"
}
