# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-attrdict
pkgname=('python-attrdict' 'python2-attrdict')
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="A library that provides mapping objects that allow their elements to be accessed both as keys and as attributes."
arch=('any')
url="https://github.com/bcj/attrdict"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('35c90698b55c683946091177177a9e9c0713a0860f0e049febd72649ccd77b70')

prepare() {
  cp -a attrdict-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/attrdict-${pkgver}
  python setup.py build

  cd "${srcdir}"/attrdict-${pkgver}-py2
  python2 setup.py build
}

package_python-attrdict() {
  cd attrdict-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-attrdict() {
  cd attrdict-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
