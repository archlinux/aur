# Maintainer:  Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgname='python2-axolotl-git'
_pkgname='python-axolotl'
pkgver=r39.9585d72
pkgrel=1
pkgdesc="Python port of libaxolotl"
url="https://github.com/tgalal/python-axolotl"
arch=('any')
license=('GPL')
depends=('python2' 'python2-dateutil' 'python2-protobuf' 'python2-crypto' 'python2-axolotl-curve25519-git')
makedepends=('python2-setuptools')
conflicts=('python2-axolotl')
provides=('python2-axolotl')
source=('git://github.com/tgalal/python-axolotl')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/"
}
