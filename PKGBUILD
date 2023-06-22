# Maintainer: robertfoster
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-core
pkgver=4.4.2
pkgrel=1
pkgdesc='Python Social Auth core component'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD')
depends=('python-six' 'python-defusedxml' 'python-pyjwt' 'python-jose' 'python-requests-oauthlib'
  'python-openid' 'python-cryptography' 'python3-saml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0c56c3d7e5bdc8fddfcfe9f7a82f7d56d83bb378cd9898fd779c8ba804662e89')

build() {
  cd social-core-"${pkgver}"
  python setup.py build
}

package() {
  cd social-core-"${pkgver}"
  python setup.py install \
    --root "${pkgdir}" \
    --optimize=1

  install -Dm644 "${srcdir}/social-core-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  rm -rf "${pkgdir}/usr/lib/python3.11/site-packages/social_core/tests"
}
