# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=pyre-check
_py=py3
pkgname=pyre-check-bin
pkgver=0.0.29
pkgrel=1
pkgdesc="Performant type-checking for Python"
arch=('any')
url="https://pyre-check.org/"
license=('MIT')
depends=('python')
provides=('pyre-check')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")
sha256sums=('6bcc705d4f9f758fab8055164e6fa2aa47f5fcf863fb4b7b7b1f47a11e83b183')

package() {
	PIP_CONFIG_FILE=/dev/null pip install \
		--isolated \
		--root="$pkgdir" \
		--ignore-installed \
		--no-deps \
		--no-warn-script-location \
		*.whl

	python -O -m compileall "${pkgdir}/usr/lib/python3.7/site-packages/pyre_check"

	install -D -m644 \
		"${pkgdir}/usr/lib/python3.7/site-packages/pyre_check-${pkgver}.dist-info/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
