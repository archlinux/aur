# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname='python2-astropy'
_name="${pkgname#python2-}"
pkgver=2.0.16
pkgrel=2
pkgdesc='A community python library for astronomy'
arch=('i686' 'x86_64')
url='https://www.astropy.org/'
license=('BSD')
depends=(
  'cfitsio'
  'erfa'
  'expat'
  'python2'
  'python2-numpy'
  'python2-h5py'
  'python2-jinja'
  'python2-scipy'
  'wcslib'
)
conflicts=(
  'python2-pyfits'
  'python-pywcs'
  'python2-vo'
)
makedepends=('cython2')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('50c22e3640a903a103c53a86873fae202a34fd54a9bcd87f3b0896fa75b3ced63821649084e89286750d8c89777e16b18910d1ad531876f80b238c78b7a8e431')

build() {
  cd "${_tarname}"
  python2 setup.py build --use-system-libraries --offline
}

package() {
  cd "${_tarname}"

  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python2 setup.py install --offline --root="${pkgdir}" --prefix='/usr' --optimize=1

  mv "${pkgdir}/usr/bin/fitscheck" "${pkgdir}/usr/bin/fitscheck2"
  mv "${pkgdir}/usr/bin/fitsdiff" "${pkgdir}/usr/bin/fitsdiff2"
  mv "${pkgdir}/usr/bin/fitsheader" "${pkgdir}/usr/bin/fitsheader2"
  mv "${pkgdir}/usr/bin/fitsinfo" "${pkgdir}/usr/bin/fitsinfo2"
  mv "${pkgdir}/usr/bin/samp_hub" "${pkgdir}/usr/bin/samp_hub2"
  mv "${pkgdir}/usr/bin/volint" "${pkgdir}/usr/bin/volint2"
  mv "${pkgdir}/usr/bin/wcslint" "${pkgdir}/usr/bin/wcslint2"
  mv "${pkgdir}/usr/bin/fits2bitmap" "${pkgdir}/usr/bin/fits2bitmap2"
}
