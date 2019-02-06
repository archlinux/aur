# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Carl Bordum Hansen <carl at bordum dot dk>

pkgname=manly-git
_name=manly
pkgver=r101.77d25dd
pkgrel=1
pkgdesc="A compliment to the man pages."
url="https://github.com/mpolidori/manly"
depends=('python')
license=('MIT')
arch=('any')
source=('git+https://github.com/mpolidori/manly.git')
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
  mv manly.py $_name
  install -Dm 0755 -t ${pkgdir}/usr/bin $_name
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
