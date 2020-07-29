# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=mailman-rss
pkgver=0.2.4
pkgrel=1
pkgdesc='Mailman archive to rss/twitter bot'
arch=('any')
url='https://github.com/kyamagu/mailman-rss'
_rawurl="https://raw.githubusercontent.com/${url##*github.com/}"
license=('MIT')
depends=('python-beautifulsoup4' 'python-dateutil' 'python-future' 'python-requests')
makedepends=('python-setuptools')
optdepends=('python-twitter: twitter bot functionality')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::${_rawurl}/master/LICENSE")
sha256sums=('0030e2ba55cf77b96d8777956270909cc68b77a7d5314093ea4f7909ce8c39af'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim: ts=2 sw=2 et:
