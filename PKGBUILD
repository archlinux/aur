# Contributor: Thomas Oster <thomas.oster@rwth-aachen.de>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs
pkgver=0.16
pkgrel=1
pkgdesc="A project with the goal of developing a collection of utilities to allow for better client integration with some of the popular version control systems (core)"
arch=('any')
url="http://rabbitvcs.org/"
install=${pkgname}.install
changelog=${pkgname}.changelog
depends=('git' 'pygtk' 'python2-pysvn' 'python2-dulwich' 'python2-gobject2' 'python2-configobj' 'python2-simplejson' 'python2-gtkspellcheck')
optdepends=('meld: graphical diff viewer')
makedepends=('python2-setuptools')
license=('GPL')
source=("https://github.com/rabbitvcs/rabbitvcs/archive/v0.16.tar.gz")
md5sums=('25376cff136ad2fac901ff88e07893ef')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s#env python#env python2#" setup.py
	find . -name "*.py" | xargs grep -l sys.executable | xargs sed -i 's|sys\.executable|"/usr/bin/python2"|g'
	python2 setup.py build 
}
	
package(){
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
