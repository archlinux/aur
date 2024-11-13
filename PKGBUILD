# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=flask-seasurf
pkgname='python-flask-seasurf'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='Flask extension for preventing cross-site request forgery (CSRF)'
arch=('any')
url='http://flask-seasurf.readthedocs.io'
license=('BSD-3-Clause')
depends=(python python-flask python-werkzeug)
makedepends=(python-setuptools)
checkdepends=(python-mock)

source=("$pkgname-$pkgver.tar.gz::https://github.com/maxcountryman/flask-seasurf/archive/$pkgver.tar.gz")
sha256sums=('d0f76af8abd993ca3dcb6d2065fa242900c2078bf0fb70cb81a17eba0b6b0705')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --skip-build --root="${pkgdir}" --prefix="/usr"
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m unittest test_seasurf.py
}

# vim:set ts=2 sw=2 et:
