# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_components='itk itk-segmentation itk-io itk-registration itk-core itk-numerics itk-filtering'
_py=cp36
pkgname=python-itk
pkgver=4.13.0
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
md5sums=('180434248774211ac5043128fee8cee1'
         '3db37ab06ceb902f53947bbbfbedc4f1'
         'ae569328ce51f522d2d6722e8762601f'
         '717c5d6f218716c3f20cf7a029077a7e'
         'bfdfd8d37b066bdbdc8b3d0f61aa0e22'
         'da955cbd76229f891f1a678e149d47a2'
         '927919dd02c23dd86266576c238aaed0')

for _name in $_components; do
	source+=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-${_py}m-manylinux1_x86_64.whl")
done


package() {
    
    # NOTE
	# The official Python wheel does not wrap all image types.
	# To have them, ITK must be built from source using the
	# package insight-toolkit, enabling Python wrapping and
	# additional components to be wrapped in the CMake config.
    
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

