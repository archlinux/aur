# Maintainer: Dr-Noob <peibolms at gmail dot com>
_name=cpufetch
pkgname="$_name-git"
pkgver=v0.94.r43.g8f2f3d3
pkgrel=1
pkgdesc="Simple yet fancy CPU architecture fetching tool"
arch=('x86_64')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
url="https://github.com/Dr-Noob/cpufetch"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
source=("git+https://github.com/Dr-Noob/cpufetch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name"
  install -Dm755 "cpufetch"   "$pkgdir/usr/bin/cpufetch"
  install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "cpufetch.8" "$pkgdir/usr/share/man/man8/cpufetch.8.gz"
}
