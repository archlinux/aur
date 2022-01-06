# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.24.1
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('7a5563cd7dad95c410f682b257d3db77df31f9305dea5cc88ca87c67cbb16b47')

# build() {
#         echo ''
# }

package() {
	PIP_CONFIG_FILE=/dev/null pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"

	# cd "${pkgdir}/usr/lib/python3/site-packages/cmake_init_lib"
	COMPILE_DIR=$(find "${pkgdir}" -name cmake_init_lib -type d | head -n 1) # this is a shitty hack, please inform me of a better way to do this.
	[ ! -z "$COMPILE_DIR" ] && python -O -m compileall  "${COMPILE_DIR}"
}
