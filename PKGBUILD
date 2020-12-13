# Maintainer: Florian Daniel <fd@noxa.de>
# Contributor: Eldar Tsraev <elts@culab.org>
# Contributor: Andreas Guth <andreas.guth@rwth-aachen.de>
# Contributor: Alexander Neumann <alexander@bumpern.de>
options=(!strip)
pkgname=restic-git
pkgver=v0.9.3.r53.g920727dd
pkgrel=1
pkgdesc="restic is a program that does backups right."
arch=('i686' 'x86_64')
url="https://github.com/restic/restic"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
provides=('restic')
conflicts=('restic')
source=("${pkgname}::git+https://github.com/restic/restic")
md5sums=('SKIP')

importpath='github.com/restic/restic'

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  go run build.go
  ./restic generate --man doc/man
}

package() {
  install -Dm755 "$pkgname/restic"    "$pkgdir/usr/bin/restic"
  install -Dm644 "$pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/README.rst" "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname"/doc/man/*.1
}

# vim:set ts=2 sw=2 et:
