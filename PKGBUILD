# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=python-rust2rpm
pkgver=27.0.1
pkgrel=1
pkgdesc="Tool for automatically generating RPM spec files for Rust crates"
arch=('any')
url="https://pagure.io/fedora-rust/rust2rpm"
license=('MIT')
depends=('python' 'python-cargo2rpm' 'python-jinja' 'python-jsonschema' 'python-pyparsing' 'python-requests' 'python-termcolor' 'python-tqdm' 'rust2rpm-helper')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy')
source=("https://pagure.io/fedora-rust/rust2rpm/archive/v${pkgver}/rust2rpm-v${pkgver}.tar.gz")
sha256sums=('388f5c522f020de504d76c2ca409ecff29d8f4bfb7b537422570778543d7ed49')

build() {
	cd rust2rpm-v$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd rust2rpm-v$pkgver
	PYTHONPATH=. pytest
}

package() {
	cd rust2rpm-v$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
