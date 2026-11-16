# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Alex Hirzel <alex at hirzel period us>

_name=datasette
pkgname="${_name}"
pkgver=0.65.6
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

    # Namcap detection
    python
    python-babel
    python-flexparser
    python-platformdirs
    python-flexcache
    python-markupsafe
    python-typing_extensions
)
makedepends=(python-build python-installer python-wheel)
conflicts=("datasette")

source=("${_name}-$pkgver.tar.gz::https://github.com/simonw/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eaf4f0be261f9221dfb6b54249d98b7463e0fe74ebd691becfe65d5105e24d68')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
}

