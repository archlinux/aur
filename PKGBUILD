# Contributor: Ethan Zonca <e@ethanzonca.com>
pkgname=python-pyenet-git
provides=('pyenet')
conflicts=('pyenet')
pkgdesc="pyenet is a python wrapper for the ENet library"
url="https://github.com/aresch/pyenet"
pkgver=24
pkgrel=2
arch=('i686' 'x86_64' 'armv7h')
license=('BSD' 'MIT')
depends=('python' 'cython')
makedepends=('git')

_enetpackage="enet-1.3.13"

source=("git+https://github.com/aresch/pyenet.git" "http://enet.bespin.org/download/${_enetpackage}.tar.gz")
md5sums=('SKIP' 'b83b9a7791417b6b6f5c68231f6e218b')

build() {
	mkdir -p pyenet/enet/
	mv -T $_enetpackage pyenet/enet/
	cd $srcdir/pyenet
	python setup.py build
}

package() {
	cd "$srcdir/pyenet"
	python setup.py install --root="$pkgdir/" --optimize=1 
}
