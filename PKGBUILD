# Maintainer David McInnis <davidm@eagles.ewu.edu>

pkgname=('python-pygpu')
pkgver=r1335.fc7a592
_reponame="libgpuarray"
pkgrel=1
pkgdesc="Python3 bindings for libgpuarray"
arch=('any')
url="https://github.com/Theano/libgpuarray"
license=('MIT')
depends=('libgpuarray-git')
checkdepends=('python-nose')
makedepends=('git' 'cmake' 'cython')
optdepends=('python-pycuda' 'python-pyopencl')
source=('git+https://github.com/Theano/libgpuarray.git')
md5sums=('SKIP')

pkgver() {
	cd "$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg "Building....."
  cd "$srcdir/${_reponame}"
  python setup.py build_ext -L /usr/lib -I /usr/include
	
}

check() {
  msg "Checking...."
  cd "$srcdir/${_reponame}"
  python setup.py test
	
}

package() {
  cd "$srcdir/${_reponame}"
    python setup.py install --root="$pkgdir"/ --optimize=1
    mkdir -p "${pkgdir}/usr/include/gpuarray"
    mv "${pkgdir}/usr/pygpu" "${pkgdir}/usr/include/gpuarray/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
