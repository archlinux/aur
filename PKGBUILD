# Maintainer: Ivan Semkin <ivan AT semkin DOT org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Originally maintained and submitted: mitsuse <mitsuset - gmail>

_pkgname=flask-script
pkgname=python2-flask-script
pkgver=2.0.6
pkgrel=1
pkgdesc='Flask extension to help writing external scripts for Flask applications'
arch=('any')
url='https://github.com/smurfix/flask-script'
license=('BSD')
depends=('python2-flask')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/smurfix/flask-script/archive/v${pkgver}.tar.gz
        flask.ext.script_import.patch::https://github.com/smurfix/flask-script/commit/fcf894b6e4d0ad17489480b722c870aaea600db1.patch)
sha256sums=('1c18e25966e966e6ffa9e8798840b1e663f471cba09be8e463e1b0addf4e76ef'
            'cb1feb6965baf7c7e9250e8eecfd821bd57d0432d8c15ac83ff66e7f0a87972a')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/flask.ext.script_import.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python2 tests.py
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 664 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
