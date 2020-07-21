# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> 

pkgname=python2-fuse
pkgver=1.0.0
pkgrel=2
pkgdesc='This is a Python 2 interface to libfuse (https://github.com/libfuse/libfuse), a simple interface for userspace programs to export a virtual filesystem to the Linux kernel'
arch=('x86_64')
url="https://pypi.org/project/fuse_python/$pkgver"
license=('LGPL')
depends=('fuse2' 'python2')
source=("https://files.pythonhosted.org/packages/ab/34/c2d89e97ac8df2b22d453e44700bacb61b3c73a3538a7e5d81a1e6780e4a/fuse-python-$pkgver.tar.gz")
sha256sums=('cbaa21c8f0a440302d1ba9fd57a80cf9ff227e5a3820708a8ba8450db883cc05')

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
