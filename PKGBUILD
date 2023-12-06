# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=python-csdr-luarvique
pkgver=0.18.16
pkgrel=1
pkgdesc="Python bindings for the csdr library."
arch=('x86_64')
url="https://github.com/luarvique/pycsdr"
license=('GPL3')
depends=('python' 'gcc-libs' 'csdr')
makedepends=('git' 'python-setuptools')
conflicts=('python-csdr')
provides=('python-csdr')
source=("$pkgname"::"git+https://github.com/luarvique/pycsdr#tag=${pkgver}")
md5sums=('SKIP')


build() {
	cd "$srcdir/$pkgname"
	python setup.py build -b ../build -t ../build-tmp
}

package() {
	cd "$srcdir/$pkgname"
	# Sadly, setuptools still don't support separate build directory: https://github.com/pypa/setuptools/issues/1347
	python setup.py build -b ../build -t ../build-tmp install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
