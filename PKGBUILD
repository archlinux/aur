# Maintainer: Jonas Hvid <mail@johv.dk>
pkgname=muwrap-git
pkgver=r21.414e7e9
pkgrel=1
pkgdesc="Text word wrapping utility for the command line"
arch=('x86_64')
url="https://github.com/c2d7fa/muwrap"
license=('MIT')
depends=('glibc')
makedepends=('git' 'nim')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('muwrap::git+https://github.com/c2d7fa/muwrap.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  nim compile -d:release --opt:size --passL:-s main.nim
}

check() {
  cd "$srcdir/${pkgname%-git}"
  nim compile --run test.nim
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  cp main "$pkgdir/usr/bin/muwrap"
  mkdir -p "$pkgdir/usr/share/licenses/muwrap"
  cp LICENSE "$pkgdir/usr/share/licenses/muwrap/LICENSE"
}
