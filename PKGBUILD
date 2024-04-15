# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dotbackup
pkgver=1.2.1
pkgrel=1
pkgdesc='YAML config based backup utility'
arch=('any')
url='https://github.com/jaxvanyang/dotbackup'
license=('MIT')
depends=('python-ruamel-yaml' 'python>=3.8')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-hatchling'
	'asciidoctor'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaxvanyang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b04c68f96c3b66c1c68e684d561a799c323c9fd6a5a116898ec67854fe0c24c8')

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
