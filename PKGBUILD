# Maintainer: Felix Schindler <aur at felixschindler dor net>
pkgname=diff-ignore-moved-lines-git
_pkgname=diff-ignore-moved-lines
pkgver=0.0.r15
pkgrel=1
pkgdesc="Strip moved lines from a diff"
arch=('x86_64')
url="https://github.com/l0b0/diff-ignore-moved-lines"
license=('GPL-3.0-only')
source=(git+https://github.com/l0b0/diff-ignore-moved-lines.git#branch=master)
makedepends=('git' 'make' 'shunit2')
depends=('bash')
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "0.0.r$(git rev-list --count master)"
}

check() {
  cd "${srcdir}/${_pkgname}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d ${pkgdir}/usr/bin
  install -m 755 diff-ignore-moved-lines.sh ${pkgdir}/usr/bin/diff-ignore-moved-lines
  sed -i 's/diff-ignore-moved-lines.sh/diff-ignore-moved-lines/g' ${pkgdir}/usr/bin/diff-ignore-moved-lines
}
