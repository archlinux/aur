# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=pytest-discord
pkgname=python-${_pkgname}
pkgver=0.0.4
pkgrel=1
pkgdesc='pytest plugin to report test results to a Discord channel'
arch=('any')
url='https://github.com/thombashi/pytest-discord'
license=('MIT')
depends=('python'
        'python-aiohttp'
        'python-discord'
        'python-pathvalidate'
        'python-pytest'
        'python-pytest-md-report'
        'python-typepy')
makedepends=('python-setuptools')
checkdepends=('python-mock')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('58a4e9b6ded8459aebfcb0f14cad98084418c61fb4f48f0d5ac7f0e9fee4e781')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
