# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
_python_version='3.8'
_py="cp${_python_version//./}"
pkgname=python-simpleitk
pkgver=1.2.4
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
sha256sums=('3ca6e5f798121bb4c86214a480f74c9211d8d9def7081778083ed97502f37892')

package() {
	cd "$srcdir"

	# Use wheel: no sdist available on PyPI at the time this was written
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/SimpleITK"
}

