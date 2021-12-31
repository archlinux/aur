# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=python-itk-bin
_name=${pkgname#python-}
pkgver=5.3rc2.post1
pkgrel=1
pkgdesc="Open-source toolkit for multidimensional image analysis"
arch=('x86_64')
url='https://itk.org/'
license=('Apache')
depends=('python-numpy')
provides=('python-itk')
conflicts=('python-itk')
makedepends=('python-pip')
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
_py="cp${_python_version//./}"
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/itk/itk-$pkgver-${_py}-${_py}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
sha256sums=('812ee349ab50cae56c267f2f65a8c10ed99fd40c3539cd1cf9a09a28c86aa222')
noextract=("${source[@]##*/}")

package() {
	cd "$srcdir"

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/ITK"
}
