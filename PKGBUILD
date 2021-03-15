# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=pamtester
pkgver=0.1.2
pkgrel=4
pkgdesc="Tiny program to test the pluggable authentication modules (PAM) facility"
arch=(i686 x86_64 armv7h aarch64)
url="http://pamtester.sourceforge.net/"
license=(custom)
depends=(pam)
source=("http://sourceforge.net/projects/pamtester/files/pamtester/$pkgver/pamtester-$pkgver.tar.gz")
sha256sums=('83633d0e8a4f35810456d9d52261c8ae0beb9148276847cae8963505240fb2d5')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2:sw=2:et
