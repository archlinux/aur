# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pythontexfigures'
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc='Embed matplotlib figures into LaTeX documents using PythonTeX'
arch=('any')
url='https://github.com/mje-nz/pythontexfigures'
license=('BSD')
depends=('python' 'python-matplotlib' 'python-pygments')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-Readme.md::${url}/raw/master/Readme.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/master/LICENSE")
sha256sums=('99f2c9bff53ce5a41fa901add18328f0a767017949aee3198d58619c4fba9a4c'
            'SKIP'
            'SKIP')

prepare() {
  cp -f "${_pkgname}-${pkgver}-Readme.md" "${_pkgname}-${pkgver}/Readme.md"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${_pkgname}-${pkgver}-Readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
