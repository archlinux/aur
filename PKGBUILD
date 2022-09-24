# Maintainer: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=hardcode-fixer-git
_pkgver=2.0
pkgver=2.0
pkgrel=1
#epoch=2
pkgdesc="Fixes Hardcoded Icons"
arch=('i686' 'x86_64')
url="https://github.com/Foggalong/hardcode-fixer"
license=('GPL')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/Foggalong/hardcode-fixer.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "$_pkgver" "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/fix.sh" "$pkgdir/usr/bin/hardcode-fixer"
}
