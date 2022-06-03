# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=addinclude
pkgver=1.2.0
pkgrel=1
pkgdesc='Add include statements to header and sourcefiles, for C and C++'
arch=(x86_64)
url='https://github.com/xyproto/addinclude'
license=(GPL2)
makedepends=(go)
source=("https://github.com/xyproto/addinclude/releases/download/v1.2.0/addinclude-1.2.0.tar.xz")
b2sums=('0ae646d99549fa6e3e9d76aea1c4b3046215339129caaf5c7d21a2629bbe841fd5fc91cdbffcd72ba717d3b325ed880e5173947781beca8ea55f7937423a2a8e')

build() {
  cd $pkgname-$pkgver
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
