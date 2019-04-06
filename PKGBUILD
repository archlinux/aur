# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_components='itk itk-segmentation itk-io itk-registration itk-core itk-numerics itk-filtering'
_py=cp37
pkgname=python-itk
pkgver=4.13.2.post1
pkgrel=1
pkgdesc="Open-source toolkit for multidimensional image analysis"
arch=('x86_64')
url='https://itk.org/'
license=('Apache')
depends=('python-numpy')
makedepends=('python-pip')
options=('!strip')
optdepends=()
source=()
md5sums=('89e1e0c3c65ceefa17650078f717c39c'
         '9eaf17219f1a01b7ed2cbebf0f85cf0f'
         'faf843f285db893b8abf22e940de942d'
         '4d95fd6f61a1f4c16453da1d96c1366a'
         'dda686c97d792e3ac85a3e4717f96565'
         '570facb31b3a666042f53f18ce45a990'
         '25fafa150f3d547364cf52c16866cf6b')

for _name in $_components; do
	source+=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
done

noextract=("${source[@]##*/}")


package() {

	# NOTE
	# Not all image types are wrapped in the official Python wheel.
	# If you need any type that is not included, you should build
	# ITK from sources using the insight-toolkit package, editing
	# the PKGBUILD to enable Python wrapping and adding to the CMake
	# confing any additional component you want to include.

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	python -O -m compileall "${pkgdir}/usr/lib/python3.7/site-packages/itk"
}

