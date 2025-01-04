# Maintainer: FichteFoll <fichtefoll2@googlemail.com>
# Contributor: Nafis <mnabid.25@outlook.com>

pkgname=python-anitopy-git
_pkgname=${pkgname%-git}
_name=${_pkgname#python-}
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
source=("git+${url}.git")
b2sums=(SKIP)

pkgver() {
	cd $_name
	git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

build() {
	cd $_name
	python -m build --wheel --no-isolation
}

package() {
	cd $_name
	python -m installer --destdir="$pkgdir" dist/*.whl
}
