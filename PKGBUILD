# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=openrtm-aist-python
pkgver=1.1.0
pkgrel=1
pkgdesc="Python bindings for OpenRTM-aist"
arch=('i686' 'x86_64')
url="http://www.openrtm.org"
license=('GPL')
depends=('omniorb' 'python2')
source=("http://www.openrtm.org/pub/OpenRTM-aist/python/${pkgver}/OpenRTM-aist-Python-${pkgver}-RC1.tar.gz")
md5sums=('bbc9c4915d13cef0f5a925a070bab0aa')

build() {
	cd ${srcdir}/OpenRTM-aist-Python-${pkgver}
	
	sed 's/-bpython/-p -bpython/g' -i setup.py

	# Fix for Python 2 scripts
	sed -i "s,env python *$,env python2,g" $(find . -type f -and -iname "*.py")
	sed -i "s,/usr/bin/python *$,/usr/bin/env python2,g" $(find . -iname "*.py")
	
	python2 setup.py sdist
	python2 setup.py build
}

package() {
	cd ${srcdir}/OpenRTM-aist-Python-${pkgver}
	
	python2 setup.py install --root=${pkgdir} --optimize=1
}

