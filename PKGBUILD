# Maintainer: Weather (Anonymous Name)

pkgname=python-lazurite
_pkg=lazurite
pkgver=0.8.3
pkgrel=1
pkgdesc='Unofficial shader development tool for Minecraft: Bedrock Edition with RenderDragon graphics engine'
arch=('any')
url="https://github.com/veka0/lazurite"
license=('LGPL-3.0')
depends=('python-json-five' 'python-pcpp' 'python-pycryptodome' 'python-sympy' 'python-mpmath', 'python-myers')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
_checkdepends=('python-pytest' 'python-flask' 'python-django')
source=("$_pkg-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=('f6fe78b2f34b7cc47eada80e69bd789479a785de7a1906fd1beca7b81cb22c02')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

_check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

