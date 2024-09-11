# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=datasette
_name=$pkgname
pkgver=0.64.8
pkgrel=1
pkgdesc="An open source multi-tool for exploring and publishing data"
arch=("any")
url="https://datasette.io"
license=("Apache-2.0")
depends=(
	# from setup.py install_requires
	python-asgiref
	python-click
	python-click-default-group
	python-jinja
	python-hupper
	python-httpx
	python-pint
	python-pluggy
	uvicorn
	python-aiofiles
	python-janus
	python-asgi-csrf
	python-yaml
	python-mergedeep
	python-itsdangerous
	python-setuptools
	# pip is assumed

	python-rich
	python-importlib-metadata
)
makedepends=(python-build python-installer python-wheel)
conflicts=("datasette")
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ee54d87152b2e3e6d4552f157e3431918f5fa929c17afd0548b0d04becbd4c97')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
}
