pkgname=pypy3-numpy
pkgver=1.26.4
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'pypy3')
optdepends=('blas-openblas: faster linear algebra')
makedepends=('pypy3-setuptools' 'gcc-fortran' 'pypy3-cython')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
md5sums=('19550cbe7bedd96a928da9d4ad69509d')
sha256sums=('2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010')

build() {
	cd numpy-$pkgver
	pypy3 setup.py build
}

package() {
	cd numpy-$pkgver
	pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/pypy3-numpy/

	install -d "$pkgdir"/usr/bin
	mv "$pkgdir"/opt/pypy3/bin/f2py "$pkgdir"/usr/bin/f2py-pypy3
}
