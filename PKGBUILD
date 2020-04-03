# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Michael Polidori <michaelapolidori at gmail dot com>

pkgname=python-oxd-git
_name=python-oxd
pkgver=r52.e409486
pkgrel=1.1
pkgdesc="A CLI for the Oxford Dictionaries website."
url="https://github.com/mpolidori/python-oxd"
depends=('python')
license=('MIT')
arch=('any')
source=('git+https://github.com/mpolidori/python-oxd.git')
md5sums=(SKIP)

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_name"
  mv oxd.py oxd
  install -Dm 0755 -t ${pkgdir}/usr/bin oxd
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/oxd/LICENSE"
}
