#Maintainer: elvirolo <elvirolo@posteo.net>

_name=icalendar
pkgname=python2-icalendar
pkgver=4.0.3
pkgrel=1
pkgdesc="A parser/generator of iCalendar files (RFC 2445) (Python2 version)"
arch=('any')
url="https://github.com/collective/icalendar"
license=('BSD')
depends=('python2-dateutil' 'python2-pytz')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('07c2447a1d44cbb27c90b8c6a5c98e890cc1853c6223e2a52195cddec26c6356')

build() {
  cd "${_name}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  python2 -m unittest discover src
}

package() {
  cd "${_name}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
# Remove the icalendar binary, which conflicts with the one included in the python-icalendar package
  rm $pkgdir/usr/bin/icalendar                                      
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm 644 {CHANGES,CONTRIBUTING,README}.rst
  install -vDm 644 LICENSE.rst \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
