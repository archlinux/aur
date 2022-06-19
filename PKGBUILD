# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-rust2rpm
pkgver=21
pkgrel=1
pkgdesc="Tool for automatically generating RPM spec files for Rust crates"
arch=('any')
url="https://pagure.io/fedora-rust/rust2rpm"
license=('MIT')
depends=('python' 'python-jinja' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pagure.io/fedora-rust/rust2rpm/archive/v${pkgver}/rust2rpm-v${pkgver}.tar.gz")
sha256sums=('5ecea8fb85ba222dc06e21b65ddbd0a195d79ffa8dfd19224c232c947dcd188c')

build() {
	cd rust2rpm-v$pkgver
	python setup.py build
}

check() {
	cd rust2rpm-v$pkgver
	pytest test.py
}

package() {
	cd rust2rpm-v$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
