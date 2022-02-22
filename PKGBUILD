# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=kstart
pkgver=4.3
pkgrel=2
pkgdesc="Kerberos kinit supporting AFS and ticket refreshing"
arch=(i686 x86_64)
url="https://www.eyrie.org/~eagle/software/kstart/"
license=(custom)
depends=(krb5)
source=("https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc"
        "krenew.service"
        "kstart.service")
sha256sums=('9527702a48789084e314e5c08d4115129467ca7ef25983d7214c9439d31ef2a6'
            'SKIP'
            '09189067c7f7e91af3255684b94e31f7c1eb5ba3b7080eb98f7c5d1ef6cecaa9'
            '3b39d9c9efc1dd568c14e97b060f22d52d3de90e8ce552f521aefe33ecab02df')
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
  install -Dm644 kstart.service "$pkgdir/usr/lib/systemd/user/kstart.service"
}

# vim: ts=2:sw=2:et:ft=sh
