# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=itk
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
_py="cp${_python_version//./}"
pkgname=python-itk-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Open-source toolkit for multidimensional image analysis"
arch=('x86_64')
url='https://itk.org/'
license=('Apache')
depends=('python-numpy')
provides=('python-itk')
conflicts=('python-itk')
makedepends=('python-pip')
_wheel="$_name-$pkgver-${_py}-${_py}-manylinux2014_x86_64.whl"
noextract=("${_wheel}")
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/${_name}/${_wheel}")
sha256sums=('3f5c92ea9c11d138a203cdd2e113d638a673610e0b0f4e48a74439788b1eb268')

package() {
	cd "$srcdir"

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/ITK"
}

