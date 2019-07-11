# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-fanshim
pkgname=('python-fanshim' 'python2-fanshim')
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="Python library for the Pimoroni Fan Shim for Raspberry Pi."
arch=('any')
url="https://github.com/pimoroni/fanshim-python"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e3b4afac4e03f7858d0376f29f9ac352c2118e4f981e2e954f8edcef09c0e2ce')

prepare() {
  cp -a fanshim-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/fanshim-${pkgver}
  python setup.py build

  cd "${srcdir}"/fanshim-${pkgver}-py2
  python2 setup.py build
}

package_python-fanshim() {
  cd fanshim-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-fanshim() {
  cd fanshim-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
