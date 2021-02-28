# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
_py="cp${_python_version//./}"
pkgname=python-simpleitk
pkgver=2.0.2
pkgrel=1
pkgdesc='A simplified layer built on top of ITK'
arch=('x86_64')
url='https://simpleitk.org/'
license=('apache')
depends=('python')
conflicts=('simpleitk')
makedepends=('python-pip')
optdepends=()
noextract=("$_name-$pkgver-$_py-${_py}-manylinux1_x86_64.whl")
options=('!strip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}-manylinux1_x86_64.whl")
sha256sums=('5ab5ab167d27bb24e958f02df26b467603197b71e91b13b1635763cf64d2431f')

package() {
	cd "$srcdir"

	# Use wheel: no sdist available on PyPI at the time this was written
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/SimpleITK"
}

