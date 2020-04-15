# Maintainer: Tobias Baust <tobias.baust at tutanota dot com>
_pkgname=flammkuchen
pkgname=python-${_pkgname}-git
pkgver=0.9.2.r2.gc1b48e9
pkgrel=1
pkgdesc='flexible HDF5 saving/loading library forked from deepdish for python3'
arch=('any')
url='https://github.com/portugueslab/flammkuchen'
license=('BSD')
depends=(python python-scipy python-numpy python-pytables)
makedepends=(python-setuptools git)
source=(git+https://github.com/portugueslab/flammkuchen.git)
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
    python setup.py build
}

package() {
	cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
