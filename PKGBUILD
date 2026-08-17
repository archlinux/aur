# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=python-csdr-luarvique
pkgver=0.18.38
pkgrel=2
pkgdesc="Python bindings for the csdr library."
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/pycsdr"
license=('GPL-3.0-or-later')
depends=('python' 'gcc-libs' "csdr-luarvique>=$pkgver")
makedepends=('git' 'python-setuptools')
conflicts=('python-csdr')
provides=('python-csdr')
source=("$pkgname"::"git+https://github.com/luarvique/pycsdr#tag=${pkgver}")
md5sums=('2c2a6031f2997cd0cfb5d658093143ba')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build -b ../build -t ../build-tmp
}

package() {
    cd "$srcdir/$pkgname"
    # Sadly, setuptools still don't support separate build directory: https://github.com/pypa/setuptools/issues/1347
    python setup.py build -b ../build -t ../build-tmp install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
