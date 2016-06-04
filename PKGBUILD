# Maintainer: pingplug <pingplug@foxmail.com>

pkgbase=python-openslide
pkgname=('python-openslide' 'python2-openslide')
pkgver=1.1.0
pkgrel=1
pkgdesc="a simple interface to read whole-slide images in Python"
arch=('any')
url='http://openslide.org/'
license=('LGPL')
makedepends=('openslide' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/openslide/openslide-python/releases/download/v1.1.0/openslide-python-1.1.0.tar.xz")
sha512sums=('0ccb2aa38e2acc470304f421dce708c498e496387cd4e655c1bf61303b7378d04116683a43ca63920df2505b08efcc4f739b0f611e7d3ced8bdfd7d9a17cb06b')

prepare() {
  cp -a openslide-python-$pkgver{,-py2}
}

build() {
  cd "$srcdir/openslide-python-$pkgver"
  python setup.py build

  cd "$srcdir/openslide-python-$pkgver-py2"
  python2 setup.py build
}

package_python-openslide() {
  depends=('python-pillow' 'python-setuptools')

  cd openslide-python-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-openslide() {
  depends=('python2-pillow' 'python2-setuptools')

  cd openslide-python-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
