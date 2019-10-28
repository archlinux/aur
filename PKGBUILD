# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
_py=cp37
pkgname=python-simpleitk
pkgver=1.2.3
pkgrel=1
pkgdesc='A simplified layer built on top of ITK'
arch=('x86_64')
url='https://simpleitk.org/'
license=('apache')
depends=('python')
conflicts=('simpleitk')
makedepends=('python-pip')
optdepends=()
noextract=("$_name-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
options=('!strip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
sha256sums=('d6d23b5d97e85d5bae57eb8d6cc252714cd3a785021589fdcd1e3371c6016f14')

package() {
	cd "$srcdir"

	# Use wheel: no sdist available on PyPI at the time this was written
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python3.7/site-packages/SimpleITK"
}

