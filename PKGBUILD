# Maintainer: pingplug <pingplug@foxmail.com>

pkgbase=python-openslide
pkgname=('python-openslide' 'python2-openslide')
pkgver=1.1.1
pkgrel=1
pkgdesc="a simple interface to read whole-slide images in Python"
arch=('any')
url='http://openslide.org/'
license=('LGPL')
makedepends=('openslide' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/openslide/openslide-python/releases/download/v${pkgver}/openslide-python-${pkgver}.tar.xz")
sha512sums=('4265928585cec0162534accb36a389bc4120013383de556042d9e61f20f427c207e3cf34ec47d0a7275c600ef1ff0da7e30ef802c6cec5a2876a8066beed1454')

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
  depends=('openslide' 'python-pillow' 'python-setuptools')

  cd openslide-python-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-openslide() {
  depends=('openslide' 'python2-pillow' 'python2-setuptools')

  cd openslide-python-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
