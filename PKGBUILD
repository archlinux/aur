# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=zigup
pkgver=2022.08.25.r3.g644f8aa
pkgrel=1
pkgdesc='Download and manage Zig compilers'
arch=('x86_64')
url='https://github.com/marler8997/zigup'
license=('custom:MIT-0')
makedepends=('git' 'zig')
options=('!debug')
_commit='644f8aa15bc91159591f970e1f610de5147b4796'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/_/./g' -e 's/-/.r/' -e 's/-/./g'
}

build() {
  cd "$pkgname"

  zig build -Dfetch -Dcpu=baseline -Drelease-safe
}

check() {
  cd "$pkgname"

  zig build test -Dfetch -Dcpu=baseline -Drelease-safe
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" zig-out/bin/zigup

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
