# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon

pkgname=python-ngmix
_pkg="${pkgname#python-}"
pkgver=2.1.0
pkgrel=1
pkgdesc='Gaussian mixtures and image processing'
arch=('any')
url="https://github.com/esheldon/ngmix"
license=('GPL')
depends=('python-numpy' 'python-numba')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('5bda6377f6ecf41b9301cde0e62e55e990292c7825ffba6d5b2a0d3adcbbd50e'
            '85057d5ec4f082a3599084dbe0e874be2af2a0f91786a10933b3368e6e025898')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
	sed -i "s/__version__/$pkgver/" "$_pkg-$pkgver/setup.py"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package_python-ngmix() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
