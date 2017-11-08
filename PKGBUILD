# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli-git'
pkgver=0.0.4.r19.gdc091e4
pkgrel=1
pkgdesc='stratis-cli is a tool that provides a command-line interface (CLI) for interacting with the Stratis daemon, stratisd.'
arch=('any')
license=('apache2')
url='stratis-storage.github.io'
depends=('python-argparse' 'python-dbus' 'python-justbytes')
makedepends=('git')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=(
  'git+https://github.com/stratis-storage/stratis-cli.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname/-git}"

  git describe --tags --long           \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed 's/v//'
}

check() {
  cd "${pkgname/-git}"

  tox
}

package() {
  cd "${pkgname/-git}"

  install -d "${pkgdir}/usr/share/licenses/"

  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
