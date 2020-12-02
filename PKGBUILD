# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname='torrequest'
pkgname="python-${_pkgname}"

pkgver=0.1.0
pkgrel=3
_commit_readme='6cc228cd460dd119e053cf2168b94120be5c98d4'

pkgdesc='Simple Python interface for HTTP(s) requests over Tor'
arch=('any')
url='https://github.com/erdiaker/torrequest'
_url_pypi='https://pypi.org/project/torrequest'
license=('MIT')
# No licence file available upstream
depends=('python-pysocks' 'python-requests' 'python-stem')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-readme-${_commit_readme}::${url}/raw/${_commit_readme}/README.md")
sha256sums=('3745d4ea3ffda98d7a034363c787adb37aab77bdab40094a4d937392cd4dae82'
            '820c985c4c1e943d35b92091c7b07c68ec7a45bb93b21e2881a09f976fbe6df2')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "${_pkgname}-readme-${_commit_readme}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
