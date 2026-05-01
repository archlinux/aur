# Maintainer: robertfoster
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-core
pkgver=4.9.1 # renovate: datasource=github-tags depName=python-social-auth/social-core
pkgrel=3
pkgdesc='Python Social Auth core component'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD-3-Clause')
depends=('python-six' 'python-defusedxml' 'python-pyjwt' 'python-jose' 'python-requests-oauthlib'
  'python-openid' 'python-cryptography' 'python-saml')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('764e2b0ccecb08cd6cb70e97e494d13e032b47c0dd9ab4161dd77fcdfa1e1c6c')

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
