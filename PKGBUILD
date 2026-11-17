# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=8.3.0
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
sha512sums=('c4094f3725267f6504ed62332f9f642bfdb4dab7eedb856951ed8c4ac72122318911246a847e91ce581beff12363eb4b3c169885d1627ed2b1ef60370ae583b7')

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
