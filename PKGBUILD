# Maintainer:  Quint Guvernator <quint@guvernator.net>

pkgname=fenix-git
_pkgname=fenix
pkgver=r1.2422293
pkgrel=1
pkgdesc="respawn a process unless the user really wants to quit"
url="http://github.com/qguv/fenix"
arch=('i686' 'x86_64')
license=('Artistic2.0')
makedepends=('git')
source=("$_pkgname::git+https://github.com/qguv/fenix")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
}

package() {
  cd $_pkgname
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md ORIGINAL
  install -Dt "$pkgdir/usr/bin" fenix
}

# vim:set ts=2 sw=2 et:
