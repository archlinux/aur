# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli'
pkgver=0.0.5
pkgrel=1
pkgdesc='stratis-cli is a tool that provides a command-line interface (CLI) for interacting with the Stratis daemon, stratisd.'
arch=('any')
license=('apache2')
url='stratis-storage.github.io'
depends=('python-argparse')
makedepends=('git' 'python-pylint python-tox')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratis-cli/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'f1d9045dcade917fbd3f24704328a9e85e685b2507d83f290933ee3a2ab598c9'
)

check() {
  cd "${pkgname}-${pkgver}"

  tox
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
