# Maintainer: Christopher A. Williamson <home@chrisaw.com>

pkgname='dbus-client-gen'
pkgver=0.2
pkgrel=1
pkgdesc='A library for generating some simple classes and functions useful for a Python D-Bus client'
arch=('any')
license=('MPL-2.0')
url='stratis-storage.github.io'
depends=('python-dbus')
makedepends=('git' 'python-pylint' 'python-tox')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '973e9be47d5c8b82481100786f89cc377a320b131b4b79c2851480147f140d7e'
)

check() {
  cd "${pkgname}-${pkgver}"

  tox
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
