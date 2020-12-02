# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='mailman-rss'

pkgver=0.2.4
pkgrel=2
_commit_license='4722888c7c4b1ecb2042a10f8cf96f5936287396'

pkgdesc='Mailman archive to rss/twitter bot'
arch=('any')
url='https://github.com/kyamagu/mailman-rss'
_url_pypi='https://pypi.org/project/mailman-rss'
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-dateutil' 'python-future' 'python-requests')
makedepends=('python-setuptools')
optdepends=('python-twitter: twitter bot functionality')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-license-${_commit_license}::${url}/raw/${_commit_license}/LICENSE")
sha256sums=('0030e2ba55cf77b96d8777956270909cc68b77a7d5314093ea4f7909ce8c39af'
            '27d5c197628d3e10c3f9cb2bf6c1a9d8049834e633bb0ead3cb783418823cbbe')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "${pkgname}-license-${_commit_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
