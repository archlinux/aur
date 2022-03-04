# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sumner Evans <sumner.evans98 at gmail dot com>

pkgname=tracktime
pkgver=0.10.0
pkgrel=1
pkgdesc='Time tracking library with command line interface.'
license=('GPL3')
arch=('any')
url='https://git.sr.ht/~sumner/tracktime'
depends=(
	'python>=3.7'
	'python-pdfkit'
	'python-requests'
	'python-tabulate'
	'python-yaml')
makedepends=('python-poetry' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('04faa2cb7bd3517717b3e9a47c7d9be63ab5be8b9db5da996ba4febf95204e8c')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

## tests require a local install

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
