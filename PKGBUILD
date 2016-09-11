pkgname=('python-brotlipy-git' 'python2-brotlipy-git')
pkgver=0.6.0.184
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/python-hyper/brotlipy"
provides=('python-brotlipy' 'python2-brotlipy')
license=("MIT")
makedepends=('python' 'python2')
source=("git+https://github.com/python-hyper/brotlipy.git")
sha256sums=('SKIP')

pkgver() {
	cd brotlipy
	echo "$(python setup.py --version).$(git rev-list --count HEAD)"
}

build(){
    cd $srcdir/brotlipy
	git submodule init
	git submodule update
}

package_python-brotlipy-git(){
    depends=('python')
    pkgdesc="Python bindings to the Brotli compression library"

    cd $srcdir/brotlipy

    python3 setup.py install --root=$pkgdir/

    install -D LICENSE $pkgdir/usr/share/licenses/python-brotlipy/LICENSE
}


package_python2-brotlipy-git(){
    depends=('python2')
    pkgdesc="Python bindings to the Brotli compression library"

    cd $srcdir/brotlipy

    python2 setup.py install --root="$pkgdir/"

    install -D LICENSE "$pkgdir/usr/share/licenses/python2-brotlipy/LICENSE"
}
