# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli'
pkgver=0.5.0
pkgrel=4
pkgdesc='A CLI for the Stratis Project.'
arch=('any')
license=('Apache')
url='stratis-storage.github.io'
depends=('python' 'python-justbytes' 'dbus-client-gen' 'python-dbus-client-gen' 'python-dbus-signature-pyparsing' 'python-into-dbus')
makedepends=('dbus-glib' 'git' 'mpfr' 'python-argparse' 'python-dbus' 'python-pip' 'python-tox')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratis-cli/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '55566bb60ab247f72303ab8afaf79de98d061964f9af5ffc01858307045e4408'
)

check() {
  cd "${pkgname}-${pkgver}"

  tox
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
