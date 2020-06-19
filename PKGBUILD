# Maintainer: Brenden Davidson <davidson.brenden15@gmail.com>
pkgname="python-webpy"
pkgver="0.51"
pkgrel=1
pkgdesc="A web framework for Python"
arch=("any")
url="https://webpy.org/"
license=('custom')

_name=${pkgname#python-}

depends=(
	"python"
)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/webpy/webpy/archive/$pkgver.tar.gz"
)
sha256sums=(
	"550ed5fb18c7626c578cc2119fd45a9a898b7815fc81a4ac85ae2ed383a0ec5f"
)

build() {
	cd "$_name-$pkgver"
	/usr/bin/python setup.py build
}

package() {
	cd "$_name-$pkgver"
	/usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Add license file to the package
	mkdir -p ${pkgdir}/usr/share/licences/${pkgname}/
	install ./LICENSE.txt ${pkgdir}/usr/share/licences/${pkgname}/license
}
