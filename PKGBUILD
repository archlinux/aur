# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=qprompt
pkgname=python-${_base}
pkgver=0.16.4
pkgrel=1
pkgdesc="Library for quick CLI user menus"
arch=(any)
url="https://github.com/jeffrimko/${_base}"
license=(MIT)
depends=(python-iterfzf)
makedepends=(python-build python-installer python-hatchling)
source=(Qprompt-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('3b66f0ea2ea808ddd793af2c667281a06411851da10b4f0534bcf821162bee077f42a0cfad58da4e7adb9dffa83d7d12fb6f4f1c1627f81030be814b5077d4b0')

build() {
	cd Qprompt-${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd Qprompt-${_base}-${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
