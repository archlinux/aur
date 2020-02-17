# Contributor: Thomas Oster <thomas.oster@rwth-aachen.de>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs
pkgver=0.18.0
pkgrel=1
_gitcommit='e44328e01ed82dd8a8dbfec952f5982e355b8416'
pkgdesc="A project with the goal of developing a collection of utilities to allow for better client integration with some of the popular version control systems (core)"
arch=('any')
#url="http://rabbitvcs.org/"
url="https://github.com/rabbitvcs/rabbitvcs"
install=${pkgname}.install
changelog=${pkgname}.changelog
depends=('git' 'gtk3' 'python-pysvn' 'python-dulwich' 'python-gobject' 'python-configobj' 'python-simplejson' 'python-gtkspellcheck' 'tk')
optdepends=('meld: graphical diff viewer')
makedepends=('python-setuptools')
license=('GPL')
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
sha256sums=('a9f59d0eff65526887f719eb72712eac7d7aaa84cf9993c7b69b7b17b0b13143')
#sha256sums=('SKIP')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s#0.18#${pkgver}#" ./rabbitvcs/__init__.py
	sed -i "s#0.18#${pkgver}#" setup.py
	# sed -i "s#!= 'Darwin'#== 'toto'#" setup.py
	# sed -i "s#import hashlib#import hashlib, urllib#" ./rabbitvcs/util/helper.py
	# find . -name "*.py" | xargs grep -l sys.executable | xargs sed -i 's|sys\.executable|"/usr/bin/python2"|g'
	python setup.py build 
}
	
package(){
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
