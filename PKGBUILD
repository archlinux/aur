# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.0.0
pkgrel=1
pkgdesc="Jupyter kernel for PARI"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=(pari-sage jupyter)
makedepends=(cython2)
source=(http://mirrors.mit.edu/sage/spkg/upstream/pari_jupyter/pari_jupyter-$pkgver.tar.gz jupyter-path.patch)
md5sums=('902b290a997128e6be949c0bec44ca6e'
         'ca21ca5bb3d7c7c2465281cb996a4930')

prepare() {
  cd pari_jupyter-$pkgver
  patch -p0 -i ../jupyter-path.patch
  sed -e 's|python|python2|' -i spec/kernel.json
}

build() {
  cd pari_jupyter-$pkgver
  python2 setup.py build 
}

package() {
  cd pari_jupyter-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
