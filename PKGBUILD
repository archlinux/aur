# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_components='itk itk-segmentation itk-io itk-registration itk-core itk-numerics itk-filtering'
_py=cp37
pkgname=python-itk
pkgver=4.13.1.post1
pkgrel=1
pkgdesc='ITK is an open-source toolkit for multidimensional image analysis'
arch=('x86_64')
url='https://itk.org/'
license=('apache')
depends=('python-numpy')
makedepends=('python-pip')
options=('!strip')
optdepends=()
source=()
md5sums=('ed2fcb9dfeffacb6071d71556b168373'
         '5aa6e468061139c20e38f8b588a75c76'
         'abbedf04a9fa0acf2788a1751f92fe76'
         '69f43a2e67f3b250bffc7cfd481596b4'
         '7b3c95b06f0d24206e311fb24771786e'
         '16223a487112df0ab68df0d385523046'
         'd2e4cadf9cb6ab0ef4e345f63ce1975b')

for _name in $_components; do
	source+=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
done


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

