# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_pkgname=po4a-bulk
_gitname=po4a-bulk

pkgname=$_pkgname-git
pkgver=LATEST
pkgrel=2
pkgdesc="Automation wrappers for po4a"
arch=('i686' 'x86_64')
url="https://github.com/skybon/po4a-bulk"
license=('GPL')
depends=('po4a')
provides=("$_pkgname")
source=("git+https://github.com/skybon/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 po4a-bulk-gettextize "$pkgdir/usr/bin/po4a-bulk-gettextize"
  install -Dm755 po4a-bulk-translate "$pkgdir/usr/bin/po4a-bulk-translate"
  install -Dm755 po4a-bulk-updatepo "$pkgdir/usr/bin/po4a-bulk-updatepo"
}
