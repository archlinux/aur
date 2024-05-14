# Maintainer: robertfoster
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-core
pkgver=4.5.4
pkgrel=1
pkgdesc='Python Social Auth core component'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD')
depends=('python-six' 'python-defusedxml' 'python-pyjwt' 'python-jose' 'python-requests-oauthlib'
  'python-openid' 'python-cryptography' 'python3-saml')
makedepends=( 
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0070f7d9a0eb4903de2990d6b8cd42ff5ea91f8caff83386a2f6a087ebeaa577')

build() {
  cd social-core-"${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd social-core-"${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "${srcdir}/social-core-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  rm -rf "${pkgdir}/usr/lib/python3.11/site-packages/social_core/tests"
}
