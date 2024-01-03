# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dotbackup
pkgver=0.0.3
pkgrel=3
pkgdesc='YAML config based backup utility'
arch=('any')
url='https://github.com/jaxvanyang/dotbackup'
license=('MIT')
depends=('python-ruamel-yaml' 'python>=3.8')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaxvanyang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5245f9d8f792b11d81c19bc5f66103611b16b78b5cdcb0516d7556e5ed601bc1')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	pytest
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
