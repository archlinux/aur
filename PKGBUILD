# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=certbot-dns-inwx
pkgver=2.1.3
pkgrel=1
pkgdesc="INWX DNS authenticator plugin for certbot"
arch=(any)
url="https://github.com/oGGy990/certbot-dns-inwx"
license=(Apache)
makedepends=(python-setuptools)
depends=(certbot python)
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha512sums=('SKIP')
backup=(
  "etc/letsencrypt/inwx.cfg"
)

build() {
  cd "${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"

  chmod 0600 "${pkgdir}/etc/letsencrypt/inwx.cfg"
}
