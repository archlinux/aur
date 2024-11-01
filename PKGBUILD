# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Xiang Chen <iflygo@outlook.com>

pkgname=zigup
pkgver=2024.05.05.r8.g67643d6
pkgrel=1
pkgdesc='Download and manage Zig compilers'
arch=('x86_64')
url='https://github.com/marler8997/zigup'
license=('MIT-0')
depends=('tar')
makedepends=('git' 'zig')
options=('!debug')
_commit='67643d63359502d8dab9628ad071c61837a55b02'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/_/./g' -e 's/-/.r/' -e 's/-/./g'
}

build() {
  cd "$pkgname"

  zig build --release=fast
}

# check() {
#   cd "$pkgname"
#
#   zig build test
# }

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" zig-out/bin/zigup

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
