# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=16.0.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-flit-core' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bbcd6054f97ab11c6ca864e648fb03516cc3f3254e2f024bc2cbbab5d19a2dd1fdbba1de88df7b64d8fa070e0bdfb6fcf427f6ca6fc3b97cb781a86853631793')
b2sums=('73a604fc128b6291b1a86278634a6a421c3a1f85c701439715bbe278c16c601d659685c6f8020cac623dec7c526d78894727e51b53520bc277a8f587983d54dd')

prepare() {
	cd "$_name-$pkgver"
	sed -i 's/requires = \["flit_core >=3.11, <4"\]/requires = ["flit_core >=3.11"]/' pyproject.toml
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

