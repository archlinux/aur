# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=7.11.0
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
sha512sums=('0b42cf155133293191c2d9c06f5b71f425c43dd42634808ab614564074da85fbc0c8954b96ecca0c5e887ea42724b0d71fb7e1483abde2a402a621c0773aadd2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
