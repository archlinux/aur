# Contributor: Ethan Zonca <e@ethanzonca.com>
pkgname=python2-pyenet-git
provides="python2-pyenet"
conflicts="python2-pyenet"
pkgdesc="pyenet is a python wrapper for the ENet library"
url="http://code.google.com/p/pyenet"
pkgver=24
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
license=('BSD' 'MIT')
depends=('python2' 'cython2')
makedepends=('git')

_enetpackage="enet-1.3.6"

source=("git+https://github.com/aresch/pyenet.git" "http://enet.bespin.org/download/${_enetpackage}.tar.gz")
md5sums=('SKIP' '215faae73d7e1f0d6dc48676884d07c7')

build() {
	mkdir -p pyenet/enet/
	mv -T $_enetpackage pyenet/enet/
	cd $srcdir/pyenet
	python2 setup.py build
}

package() {
	cd "$srcdir/pyenet"
	python2 setup.py install --root="$pkgdir/" --optimize=1 
}
