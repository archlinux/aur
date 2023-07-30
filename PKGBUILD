# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=greaseweazle
pkgver=1.15
pkgrel=2
epoch=
pkgdesc="Tools for accessing a floppy drive at the raw flux level"
arch=('x86_64')
url="https://github.com/keirf/greaseweazle"
license=('Unlicense')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
depends=('python' 'python-crcmod' 'python-bitarray' 'python-pyserial' 'python-requests')
optdepends=('capsimage: Read IPF files')
source=("https://github.com/keirf/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.zip")
sha256sums=('478aef987ace4a3683facd38b6e854f657a0ab30abdb3ec94c3f581e4ad61586')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 scripts/49-greaseweazle.rules "$pkgdir/usr/lib/udev/rules.d/49-greaseweazle.rules"
}
