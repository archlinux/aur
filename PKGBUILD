pkgname=faiss
pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('BSD')
pkgver=v1.3.0.r2.g19cea3d
pkgrel=1
source=('git+https://github.com/facebookresearch/faiss.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${srcdir}/faiss"
  ./configure && make
  make -C python
}

package() {
  cd "${srcdir}/faiss"
  make DESTDIR="$pkgdir/" includedir="usr/include/" libdir="usr/lib/" install
  cd python
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
