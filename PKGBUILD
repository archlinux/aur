# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=7.18.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://repomatic.net'
makedepends=(python-build python-installer python-uv-build)
depends=(python
	python-arrow
	python-boltons
	python-click-extra
	python-extra-platforms
	python-packaging
	python-py-walk
	python-pyelftools
	python-pyproject-metadata
	python-yaml
	python-tomlrt
	python-vt-py
	python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bd79fc74a35c144976682dd96e4ded32a5117a27b13928d7f46554d13a678c8c4065d20c9abcc8c82f765ea84f7e1ddb0019dd62e546831fb2ec84a686b973ac')

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
