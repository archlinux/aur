# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=cupy
_pkgname="python-${_name}"
pkgname="${_pkgname}-bin"
pkgver=13.4.0
pkgrel=1
pkgdesc="NumPy-like API accelerated with CUDA"
url="https://cupy.dev"
arch=('x86_64')
license=('MIT')
depends=(
	'cuda' 'python-fastrlock' 'python-numpy'
	'libcutensor' 'cusparselt'
)
optdepends=('libcutensor' 'nccl')
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
# https://pypi.org/project/cupy-cuda12x/#files
_wheel="${_name}_cuda12x-${pkgver}-cp313-cp313-manylinux2014_x86_64.whl"
source=(
	"https://files.pythonhosted.org/packages/68/57/62bfef84d0abe80b54f808e4429281ca60d00988649a3ab4f610e741295f/${_wheel}"
)
sha256sums=('f72a9e102f56c42ea157154928e5acc0fca2dc5fa60acc2588f9d95164691008')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
	python -m installer --destdir="$pkgdir" "${srcdir}/${_wheel}"
}
