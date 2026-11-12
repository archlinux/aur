# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=8.2.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://repomatic.net'
makedepends=(python-build python-installer python-uv-build)
depends=(python
	python-click-extra
	python-extra-platforms
	python-packaging
	python-py-walk
	python-pyproject-metadata
	python-yaml
	python-tomlrt
	python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('397f74608bd9eab72634425a504aa6286a556a0c9832c1a98dae0bdba7dbb2f5724e45c1b2f1151a0ed16725feda0d98ff934a2f2c7983290c1748b94f0692cb')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
check() {
    cd "$srcdir/$_name-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/repomatic --version
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
