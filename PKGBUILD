# Maintainer: Emil Lundberg <emil@emlun.se> <emil@yubico.com>

pkgname="python-fido2"
pkgver="0.3.0"
pkgrel="6"
pkgdesc="Library for FIDO 2.0, including communication with a device over USB"
url="https://github.com/Yubico/python-fido2"
license=('custom:BSD-2-clause')
arch=('any')
depends=('python')
makedepends=('python-setuptools')

_tarball_basename="fido2-${pkgver}"
source=(
  "https://github.com/Yubico/${pkgname}/releases/download/${pkgver}/${_tarball_basename}.tar.gz"{,.sig}
)
validpgpkeys=(
  '20EE325B86A81BCBD3E56798F04367096FBA95E8' # Dain Nilsson <dain@yubico.com>
)
sha256sums=('32c0db375458853d68cbbeb04861c412a05c22c873236a0c4f71296dc983ab35'
            'SKIP')

# Tests don't currently work in release tarballs
# check() {
#   cd "${srcdir}/${_tarball_basename}"
#   python setup.py test
# }

package() {
  cd "${srcdir}/${_tarball_basename}"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 sts=2 et
