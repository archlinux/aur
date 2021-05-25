# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=addinclude
pkgver=1.1.1
pkgrel=1
pkgdesc='Add include statements to header and sourcefiles, for C and C++'
arch=(x86_64)
url='https://addinclude.roboticoverlords.org/'
license=(GPL2)
makedepends=(go)
source=("https://addinclude.roboticoverlords.org/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('962855F072C7A01846405864FCF3C8CB5CF9C8D4')
b2sums=('46a174a39a2e0ba03345707af94443525c8766fd760c48be149bb86314591c949c09b000f5b5dd51fdc410dbd884c5e2e33fac84d9733be38aba2a63e0b2d27e'
        'SKIP')

build() {
  cd $pkgname-$pkgver
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
