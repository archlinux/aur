# Maintainer: rern <rernrern@gmail.com>

pkgname=python-upnpp
pkgver=0.26.0
pkgrel=1
pkgdesc="Python UPnP control interface based on libupnpp."
url="https://www.lesbonscomptes.com/upmpdcli/libupnpp-python/upnpp-python.html"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(libnpupnp python-devtools swig)
source=(https://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-bindings-$pkgver.tar.gz)
sha256sums=('c35aed1cc9edb307191a95662873ce3d9bf86aac797356634118eaaa2b00e348')

package() {
	cd libupnpp-bindings-$pkgver
	./configure --prefix=/usr
	make
	pythonver=$( python -c 'import site; print( site.getsitepackages()[0] )' ) # /usr/lib/python3.10/site-packages
	for f in python/upnpp.py python/_upnpp.la python/.libs/_upnpp.so python/upnpp/__init__.py; do
		install -Dm 755 $f -t $pkgdir$pythonver/upnpp
	done
}
