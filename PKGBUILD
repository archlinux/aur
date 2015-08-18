# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Mike Shutlar (iFSS) <mike at epinux(dot)co(dot)uk>
pkgname=kservicemenueditor
pkgver=0.2a
pkgrel=4
pkgdesc="A simple editor for Dolphin service menus"
arch=('any')
url="http://www.sharpley.org.uk/node/3"
license=('GPL')
depends=('kdebindings-python2')
makedepends=('python2-distribute')
source=('http://sharpley.org.uk/sites/default/files/software/servicemenu/kservicemenueditor-0.2a.tar.gz')
md5sums=('ec3e5a1b39ebc16ee174ccd195162309')
sha256sums=('fc14ac538da6d039d8bdf69d7606cd47a652e97203e39296ca6c8497c9ab9c4e')

build() {
	sed -i "s/env python/env python2/" "$srcdir/$pkgname-$pkgver/servicemenueditor"
	sed -i "/from DistUtilsExtra.command/d" "$srcdir/$pkgname-$pkgver/setup.py" # Unnecessary dependency
	sed -i "s/share\/kde4\/apps/share\/apps/" "$srcdir/$pkgname-$pkgver/setup.py" # Correct directory path
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
