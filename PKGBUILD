# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-securetar'
_module=${pkgname#python-}
pkgver='2026.4.1'
pkgrel=1
pkgdesc="Python module to handle tarfile backups."
url="https://github.com/home-assistant-libs/securetar"
depends=(
	'python>=3.11'
	'python-cryptography'
	'python-pynacl'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
license=('Apache-2.0')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('44bfc2f6d8c6bf4fbf49e668a0a461c9f2295de49f7cc7e0b14e8a2da5878ece338677cbd514eb5a3fdf4a3bf85f577d6100d83c93e77bdb6e45b954ecd92b01')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
}
