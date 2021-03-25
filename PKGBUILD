# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgbase=python-control
pkgname=python-control
pkgver=0.9.0
pkgrel=2
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD')
url="https://github.com/python-control/python-control"
depends=('python-scipy'
         'python-matplotlib')
optdepends=('python-slycot: matrix equation support, model simplification tools, and state feedback')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-slycot' 'xorg-server-xvfb')
options=('staticlibs')
source=("https://github.com/python-control/python-control/archive/${pkgver}.tar.gz"
        "LICENSE")
md5sums=('281767e8b97cb99c803be610e51aa86a'
         '5e21e2b8826c3345f50711d5634bc975')

build() {
  export LDFLAGS="$LDFLAGS -shared"

  cd python-control-$pkgver
  python setup.py build
}

check() {
  cd python-control-$pkgver
  xvfb-run --auto-servernum pytest control/tests
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd python-control-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python-control/"
}
