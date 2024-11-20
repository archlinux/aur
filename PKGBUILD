# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dotbackup
pkgver=1.2.2
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
sha256sums=('294b45f0a744e62305c5e773b012505dbd8d2dbe8463e0f73c31d546093fedbb')

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
