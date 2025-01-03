# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Xiang Chen <iflygo@outlook.com>

pkgname=zigup
pkgver=2025.01.02
pkgrel=1
pkgdesc='Download and manage Zig compilers'
arch=('x86_64')
url='https://github.com/marler8997/zigup'
license=('MIT-0')
depends=('tar')
makedepends=('git' 'zig')
options=('!debug')
_commit='570255f54b42a5305703d193274a9e7702f4f194'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('53985104436ae87c2c5da421d377a2ca92c62bcfa9d5aaeeba5c159a0e6d1167519f5f7129cc3e2f69e557cb3078f98fe01277f3ee29c06fe3974ac45a7fd9a9')

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
