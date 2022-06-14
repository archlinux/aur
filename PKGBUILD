# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname='python2-ndg-httpsclient'
_name='ndg_httpsclient'
pkgver=0.5.1
pkgrel=7
pkgdesc='Provides enhanced HTTPS support for httplib and urllib using PyOpenSSL'
arch=(any)
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=(
  'python2>=2.7'
  'python2-pyasn1'
  'python2-pyopenssl'
)
makedepends=(
  'python2-setuptools'
)
options=('!emptydirs')
_tarname="${_name}-${pkgver}"
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('1c7f0a8d41b945d2b2a51cd69397ab0943cb91e25013c931f055c5608bc3a0106a99d9b126e8caaac9f8d9b409ec117631fb23f19dfd3194b783548ce3536050')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  _site_packages=$(python2 -sSc 'import site; print(site.getsitepackages()[0])')

  cd "${_tarname}"
  python2 setup.py install --skip-build -O1 --root="${pkgdir}"

  install -Dm 0644 "${pkgdir}${_site_packages}/ndg/httpsclient/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/bin/ndg_httpclient"{,2}
}
