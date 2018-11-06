# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=afl-utils-git
_gitname=afl-utils
pkgver=1.34a.272.b01a625
pkgrel=1
pkgdesc="Utilities for automated crash sample processing/analysis, easy afl-fuzz job management and corpus optimization"
url="https://github.com/rc0r/afl-utils"
arch=('any')
license=('Apache')
depends=('afl' 'coreutils' 'python' 'rsync')
optdepends=(
  'sqlite: database support'
  'screen: interactive/screen mode support'
  'gdb: gdb script execution support'
)
makedepends=('git' 'python-setuptools')
provides=('afl-utils')
conflicts=('afl-utils')
source=(${pkgname}::git+https://gitlab.com/rc0r/afl-utils)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  rm -rf "${pkgdir}"/usr/lib/python*/site-packages/tests
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 docs/CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm 644 config/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
