# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

options=(!strip)
pkgname=restic-rest-server-git
pkgver=v0.9.8.r9.gd9757b2
pkgrel=1
pkgdesc="Rest Server is a high performance HTTP server that implements restic's REST backend API."
arch=('i686' 'x86_64')
url="https://github.com/restic/rest-server"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go>=1.3')
provides=('restic-rest-server')
conflicts=('restic-rest-server')
source=("${pkgname}::git+https://github.com/restic/rest-server")
sha256sums=('SKIP')

importpath='github.com/restic/rest-server'

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  go run build.go
}

package() {
  install -Dm755 "$pkgname/rest-server" "$pkgdir/usr/bin/restic-rest-server"
  install -Dm644 "$pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
