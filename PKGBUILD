# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dotbackup
pkgver=1.1.0
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
sha256sums=('c1fc081736f396ac11e9b9ae306ad23123faeddc79d30eddf7256fdf6de610ff')

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
