# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Alex Hirzel <alex at hirzel period us>

_name=datasette
pkgname="${_name}-git"
pkgver=1.0a41.r73.77bc27bd
pkgrel=1
pkgdesc="An open source multi-tool for exploring and publishing data (bleeding-edge version)"
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
makedepends=(git python-build python-installer python-wheel)
conflicts=("datasette")

source=("git+https://github.com/simonw/${_name}#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --tags --long | sed "s/\-/.r/;s/\-g/./"
}

build() {
	cd "${srcdir}/${_name}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
}

