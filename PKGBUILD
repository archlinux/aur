# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=8.5.0
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
sha512sums=('9e0326da858da0cba5c85d195039565562b05749f67e7cd11c9bd27a5a77e032cd7afb9d1a8167857a5a3e9c030f780423f502e66c40e6dc37032c0cef069b89')

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
