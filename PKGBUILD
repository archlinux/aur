# Maintainer: rern <rernrern@gmail.com>

pkgname=python-upnpp
pkgver=0.26.0
pkgrel=1
pkgdesc="Python UPnP control interface based on libupnpp."
url="https://www.lesbonscomptes.com/upmpdcli/libupnpp-python/upnpp-python.html"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(libnpupnp python-devtools swig)
source=(https://framagit.org/medoc92/libupnpp-bindings/-/archive/libupnpp-bindings-v$pkgver/libupnpp-bindings-libupnpp-bindings-v$pkgver.tar.gz)
sha256sums=('178436ed6d576b6b1474e8c4b1d5b35d61311a6ab71521590e0e8ddc313b69d1')

package() {
	cd libupnpp-bindings-libupnpp-bindings-v$pkgver
	./autogen.sh
	./configure --prefix=/usr
	make
	pythonver=$( python -c 'import site; print( site.getsitepackages()[0] )' ) # /usr/lib/python3.10/site-packages
	for f in python/upnpp.py python/_upnpp.la python/.libs/_upnpp.so python/upnpp/__init__.py; do
		install -Dm 755 $f -t $pkgdir$pythonver/upnpp
	done
}
