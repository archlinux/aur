# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-tsne
pkgver=0.1.5
pkgrel=1
pkgdesc="Python library containing T-SNE algorithms"
arch=('any')
license=('BSD')
url="https://github.com/danielfrg/tsne"
depends=('python2-numpy' 'python2-scipy' 'cblas')
makedepends=('cython2')
source=("https://github.com/danielfrg/tsne/archive/v$pkgver.tar.gz")
md5sums=('8fe861e9cfe4021d9fd4383a46de11f8')

prepare() {
  # otherwise compile error due to duplicate definition
  sed -i "/static inline double abs/d" "$srcdir"/tsne-$pkgver/tsne/bh_sne_src/quadtree.h
}

build() {
  cd "$srcdir/tsne-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/tsne-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
