# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-speedport-api
pkgver=0.6.0
pkgrel=1
pkgdesc="Control Telekom Speedport routers with Python!"
arch=(any)
url="https://github.com/Andre0512/speedport-api"
license=(MIT)
depends=(python-aiohttp python-pycryptodome)
makedepends=(git python-build python-installer python-wheel python-setuptools python-pylint mypy flake8 python-black)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("dc51548de5e6271f31e087cf8ba61e637b3156ad5695d2bb98efe692c423be5d65eda4ad57bce9da43b1ee0343233cd41eb5e7e17b57f9eb41823ae2a96b052b")

build() {
	cd speedport-api-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd speedport-api-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
