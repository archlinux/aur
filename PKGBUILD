# Maintainer: éclairevoyant

_pkgname=python-geomag
pkgname="$_pkgname-todd-dembrey-git"
pkgver=r31.421564e
pkgrel=3
pkgdesc="Python library to calculate magnetic variation/declination (todd-dembrey fork)"
arch=(any)
# see https://code.google.com/archive/p/geomag/
license=(LGPL)
url="https://github.com/todd-dembrey/geomag"
depends=(python)
makedepends=(git python-setuptools)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url" data-install.patch)
b2sums=('SKIP'
        '049527085f0b8cf75642b0d8469769ffd2f667064080c300b7720f0dab0897f53e0b1b7c9ad775d38a6f72a010812d1ba5d5ee612f414d06db459ec9d91a8f2b')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 -i ../data-install.patch
	echo 'include geomag/model_data/*.COF' > MANIFEST.in
}

build() {
	cd $_pkgname
	python setup.py build
}

package() {
	cd $_pkgname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
