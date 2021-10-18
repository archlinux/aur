# Maintainer: dreieck
# Contributor: Gasparotto Mattia <gasmat04@gmail.com>

### Note on python version for wammu 0.44: Python2.

pkgname=wammu
pkgver=0.44
pkgrel=14
pkgdesc="A wxPython-based GUI for Gammu, a mobile phone manager."
arch=('any')
url="https://wammu.eu/wammu/"
license=('GPL')
depends=(
  'python2-gammu'
  'python2-six'
  'wxpython'
)
makedepends=(
  'python2-pybluez<0.23'
  'python2-setuptools'
)
optdepends=(
  'gnome-bluetooth: Bluetooth support'
  'python2-pybluez<0.23: Bluetooth support'
)
source=(
  "https://dl.cihar.com/${pkgname}/v0/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=(
  'bf8199f888cb60e4a24839e71ec6f8e8deb11fd22f592fe1112e3252bd4b9145'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  for _pyfile in *.py; do
    msg2 "Patching shabeng line for python2 in '${_pyfile}' ..."
    sed -E -i '1s|^#!(.*)python$|#!\1python2|' "${_pyfile}"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
