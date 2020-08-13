# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname=torrequest
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=2
pkgdesc='Simple Python interface for HTTP(s) requests over Tor'
arch=('any')
url='https://github.com/erdiaker/torrequest'
_rawurl="https://raw.githubusercontent.com/${url##*github.com/}"
license=('MIT')
# No licence file available upstream
depends=('python' 'python-pysocks' 'python-requests' 'python-stem')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-README.md::${_rawurl}/master/README.md")
sha256sums=('3745d4ea3ffda98d7a034363c787adb37aab77bdab40094a4d937392cd4dae82'
            'SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
