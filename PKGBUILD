# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=kstart
pkgver=4.2
pkgrel=2
pkgdesc="Kerberos kinit supporting AFS and ticket refreshing"
arch=(i686 x86_64)
url="https://www.eyrie.org/~eagle/software/kstart/"
license=(custom)
depends=(krb5)
source=("https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc"
        "krenew.service")
sha256sums=('2698bc1ab2fb36d49cc946b0cb864c56dd3a2f9ef596bfff59592e13d35315cd'
            'SKIP'
            'ca57afd39be992371d1008f3ac5058e1bdec537358643f32fbc13e813e007506')
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
