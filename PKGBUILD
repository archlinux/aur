# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=addinclude
pkgver=1.0.1
pkgrel=3
pkgdesc='Add include statements to header- and sourcefiles, for C and C++'
arch=(x86_64)
url='https://addinclude.roboticoverlords.org/'
license=(GPL2)
makedepends=(go)
source=("https://addinclude.roboticoverlords.org/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('962855F072C7A01846405864FCF3C8CB5CF9C8D4')
sha256sums=('af3f5a7d3472b6a871150d82b9905e6a6571ad8d80820e382e20179c7aac2e67'
            'SKIP')

build() {
  cd $pkgname-$pkgver

  go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim: ts=2 sw=2 et:
