# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=certbot-dns-inwx
pkgver=2.1.3
pkgrel=2
pkgdesc="INWX DNS authenticator plugin for certbot"
arch=(any)
url="https://github.com/oGGy990/certbot-dns-inwx"
license=(Apache)
makedepends=(python-setuptools)
depends=(certbot python)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('15c264b4960008ef70c1f8332c747d980191208b7e3b4be835a06a7fda91d894')
backup=(
  "etc/letsencrypt/inwx.cfg"
)

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"

  chmod 0600 "${pkgdir}/etc/letsencrypt/inwx.cfg"
}
