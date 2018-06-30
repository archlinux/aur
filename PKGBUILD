# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pyelastix
pkgname=python-$_pkgname
pkgver=1.1
pkgrel=3
pkgdesc="Python wrapper for the Elastix nonrigid registration toolkit"
arch=('x86_64')
url="https://github.com/almarklein/pyelastix"
license=('MIT')
depends=('python-numpy' 'elastix')
makedepends=('python-setuptools')
source=("https://github.com/almarklein/pyelastix/archive/v${pkgver}.tar.gz")
sha512sums=('e3258111ece1ad67f9de8469200ee06a3d8db4d07b85a6ba0fa96c41ba6e37445313c5cce6bda6e96bb4e1fb0d6c60dc0a5d79e5e3ce76eb55f042550ad121da')

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	# do not run Python subprocess through the shell
	sed -i '304s/True/False/' pyelastix.py

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
