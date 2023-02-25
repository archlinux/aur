# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.35.1
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('734cbfc8c192136789eb6b6b8faca6a5d27f11431cba39ceb36fb583291cde7e')

#pkgver() {
#	curl -sH "Accept: application/vnd.github.v3+json" 'https://api.github.com/repos/friendlyanon/cmake-init/tags'  | jq -r '.[0].name' | sed 's/v//;s/-/./;s/-/./'
#}

package() {
	PIP_CONFIG_FILE=/dev/null pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name//-/_}-$pkgver-py3-none-any.whl"

	# cd "${pkgdir}/usr/lib/python3/site-packages/cmake_init_lib"
	COMPILE_DIR=$(find "${pkgdir}" -name cmake_init_lib -type d | head -n 1) # this is a shitty hack, please inform me of a better way to do this.
	[ ! -z "$COMPILE_DIR" ] && python -O -m compileall  "${COMPILE_DIR}"
}
