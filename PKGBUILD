# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=rauc
pkgver=1.6
pkgrel=1
pkgdesc="RAUC controls the update process on embedded linux systems. It is both a target application that runs as an update client and a host/target tool that allows you to create, inspect and modify installation artifacts."
arch=('i686' 'x86_64')
url="https://github.com/rauc/rauc"
license=('GPL')
depends=('curl' 'json-glib')
makedepends=('python')
optdepends=(
  'casync: Casync integration support'
  'squashfs-tools: Extract or print the info of a bundle'
)
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz
        https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc)
sha256sums=('86013788dd02321b7c3f913ad3a1f8802afbc784ec076fa278524a9e1ef9e7b0'
            'SKIP')
validpgpkeys=('977843FD5C3EBF76BAD4008EA58CC53DBF05E090')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
