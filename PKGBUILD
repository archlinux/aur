# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dylan Whichard <dylan@whichard.com>

_name=stripe-python
pkgname=python-stripe
pkgver=15.3.1
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-flit-core' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/stripe/stripe-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5de00f9fc5f46e6a351b19e0f00ad2c029e4d61d8122ae96ef89e88e061707ef9ea79eda9c826d1cd32db89e4caeae94ab6d14350479b10dc1e919c5765bb76d')
b2sums=('403d4d2f0d8275b45d55ba2867a98036fa2239af00d80fc2520929e0ca240fdeb3b0d30343b93fbab8cee6037027218ca206fd9a69f48eba791a7418e8699179')

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

