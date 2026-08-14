# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=7.12.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://kdeldycke.github.io/repomatic/'
makedepends=(python-build python-installer python-uv-build)
depends=(python
	python-arrow
	python-backports
	python-boltons
	python-click-extra
	python-extra-platforms
	python-packaging
	python-py-walk
	python-pyproject-metadata
	python-yaml
	python-tomlrt
	python-vt-py
	python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6139307c56d85b6e1a56748a9cbddf265489c51c6b2f834079dcf22b5ec33fceeda8e7ca2f8583994a0ef5e86ecf3bdccc32d21da3c697a235315b36a32772a4')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
