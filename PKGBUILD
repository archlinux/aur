# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=python2-fuse
pkgver=1.0.5
pkgrel=2
pkgdesc='This is a Python 2 interface to libfuse (https://github.com/libfuse/libfuse), a simple interface for userspace programs to export a virtual filesystem to the Linux kernel'
arch=($CARCH)
url="https://pypi.org/project/fuse_python/$pkgver"
license=(LGPL)
depends=(fuse2 python2)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/5a/98/fc22a5b7cc748c6bac896aad41e1125c7f9dd5e562c15ced7b5f9576b394/fuse-python-$pkgver.tar.gz")
sha256sums=('74e5ffb33682bba9a5af2a5a048f47b7e7b464ebf84291bf5a258bfbad03a3aa')

build() {
	cd "$srcdir/${pkgname#*-}-python-$pkgver"
	python2 setup.py build
	python2 -m compileall build/lib.linux-x86_64-2.7/
}

package() {
	cd "$srcdir/${pkgname#*-}-python-$pkgver"
	install -Dm644 build/lib.linux-x86_64-2.7/fuse.py "$pkgdir/usr/lib/python2.7/site-packages/fuse.py"
	install -Dm644 build/lib.linux-x86_64-2.7/fuse.pyc "$pkgdir/usr/lib/python2.7/site-packages/fuse.pyc"
	install -Dm644 build/lib.linux-x86_64-2.7/fuse.pyc "$pkgdir/usr/lib/python2.7/site-packages/fuse.pyo"
	install -d "$pkgdir/usr/lib/python2.7/site-packages/fuse_python-$pkgver-py2.7.egg-info/"
	install -Dm644 fuse_python.egg-info/* "$pkgdir/usr/lib/python2.7/site-packages/fuse_python-$pkgver-py2.7.egg-info/"
	install -d "$pkgdir/usr/lib/python2.7/site-packages/fuseparts/"
	install -Dm644  build/lib.linux-x86_64-2.7/fuseparts/* "$pkgdir/usr/lib/python2.7/site-packages/fuseparts/"
	chmod +x "$pkgdir/usr/lib/python2.7/site-packages/fuseparts/_fuse.so"
	install -Dm644 build/lib.linux-x86_64-2.7/fuseparts/__init__.pyc "$pkgdir/usr/lib/python2.7/site-packages/fuseparts/__init__.pyo"
	install -Dm644 build/lib.linux-x86_64-2.7/fuseparts/setcompatwrap.pyc "$pkgdir/usr/lib/python2.7/site-packages/fuseparts/setcompatwrap.pyo"
	install -Dm644 build/lib.linux-x86_64-2.7/fuseparts/subbedopts.pyc "$pkgdir/usr/lib/python2.7/site-packages/fuseparts/subbedopts.pyo"
}
