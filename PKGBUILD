# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.24.0
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('e0b1ca8de2bfbbfe6b56036059cfbc1a33a7b1c8025272b4d92278ba52617748')

# build() {
#         echo ''
# }

package() {
	PIP_CONFIG_FILE=/dev/null pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"

	# cd "${pkgdir}/usr/lib/python3/site-packages/cmake_init_lib"
	COMPILE_DIR=$(find "${pkgdir}" -name cmake_init_lib -type d | head -n 1) # this is a shitty hack, please inform me of a better way to do this.
	[ ! -z "$COMPILE_DIR" ] && python -O -m compileall  "${COMPILE_DIR}"
}
