# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=kstart
pkgver=4.2
pkgrel=1
pkgdesc="Kerberos kinit supporting AFS and ticket refreshing"
arch=(i686 x86_64)
url="http://www.eyrie.org/~eagle/software/kstart/"
license=(custom)
depends=(krb5)
source=("http://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "http://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc"
        "krenew.service")
sha256sums=('2698bc1ab2fb36d49cc946b0cb864c56dd3a2f9ef596bfff59592e13d35315cd'
            'SKIP'
            '7b297db431153c4fdf65f761abaffe77e7ad1550031fc5bec3d4be4b1bfe6b15')
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir"
  install -Dm644 krenew.service "$pkgdir/usr/lib/systemd/user/krenew.service"
}

# vim: ts=2:sw=2:et:ft=sh
