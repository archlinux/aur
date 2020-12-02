# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='wbsv'

pkgver=0.2.5
pkgrel=3
_commit_license='d9e7e7b451e3dd87925f9381debb2b481d46553e'

pkgdesc='CLI tool for saving webpages to the Wayback Machine'
arch=('any')
url='https://github.com/eggplants/wbsv-cli'
_url_pypi='https://pypi.org/project/wbsv'
license=('MIT')
depends=('python-beautifulsoup4' 'python-savepagenow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-license-${_commit_license}::${url}/raw/${_commit_license}/LICENSE")
sha256sums=('ea7ea2d89c3ca65d1e6eb264a9620a2bafaefadba5b0c260bef32be456c535ac'
            'd85df8a73ab1e2324a2b5b216b408f2609e571d348eb576bdfc1a9bb3c854d19')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "${pkgname}-license-${_commit_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
