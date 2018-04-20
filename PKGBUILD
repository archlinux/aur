# Maintainer: Emil Lundberg <emil@emlun.se> <emil@yubico.com>

pkgname="python-fido2"
pkgver="0.3.0"
pkgrel="4"
pkgdesc="Library for FIDO 2.0, including communication with a device over USB"
url="https://github.com/Yubico/python-fido2"
license=('custom:BSD-2-clause')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=(
  "python-fido2-${pkgver}.tar.gz::https://github.com/Yubico/${pkgname}/archive/${pkgver}.tar.gz"
  "python-fido2-${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '57A9DEED4C6D962A923BB691816F3ED99921835E' # Emil Lundberg <emil@yubico.com>
)
sha256sums=('8648c3f0e0aa4310ee1b037f538185bad7f9c0c471158c11a20454caaec535d3'
            'SKIP')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 sts=2 et
