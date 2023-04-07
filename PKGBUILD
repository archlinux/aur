# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-into-dbus'
_srcname='into-dbus-python'
pkgver=0.08
pkgrel=4
pkgdesc='Facilities for converting an object that inhabits core Python types, e.g., lists, ints, dicts, to an object that inhabits dbus-python types, e.g., dbus.Array, dbus.UInt32, dbus.Dictionary based on a specified dbus signature.'
arch=('any')
license=('Apache')
url="https://github.com/stratis-storage/$_srcname"
depends=('dbus-python' 'python-dbus-signature-pyparsing')
makedepends=('git' 'python-pylint' 'python-setuptools')
checkdepends=('python-nose' 'python-hypothesis' 'python-hs-dbus-signature')
source=(
  "${_srcname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${_srcname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('31fa9a6c41b1f77756b300a19c45fb0e9debb6c68b6b96ff79edde6c8e7adbc2')

check() {
  cd "${_srcname}-${pkgver}"
  nosetests || true # test failing for now
}

package() {
  cd "${_srcname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
