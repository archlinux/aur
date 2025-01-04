# Maintainer: FichteFoll <fichtefoll2@googlemail.com>
# Contributor: Nafis <mnabid.25@outlook.com>

pkgname=python-anitopy-git
_pkgname=${pkgname%-git}
pkgver=2.1.1.r18.1a15190
pkgrel=3
pkgdesc="Anime video filename parser in Python, based on Anitomy"
arch=(any)
url=https://github.com/igorcmoura/anitopy
license=(MPL2)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git)
provides=($_pkgname)
conflicts=($_pkgname)
replaces=(anitopy-git)
source=("${_pkgname}::git+${url}.git")
b2sums=(SKIP)

pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

build() {
	cd $_pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}
