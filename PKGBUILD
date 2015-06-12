pkgname=pam_chroot
pkgver=0.9.2
pkgrel=3
pkgdesc="allows chroot users"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/pam-chroot/files/"
license=('GPL2')
depends=('pam')
backup=('etc/security/chroot.conf')
source=(http://downloads.sourceforge.net/project/pam-chroot/pam-chroot/v$pkgver/pam_chroot-$pkgver.tar.bz2
	pam_chroot.patch)
md5sums=('03b224b113fed5f58cca2ca5cde0aa8b'
         '5df865a2d3cbd199488fe895616f96c9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 <$srcdir/pam_chroot.patch
  make LDFLAGS=
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m0755 pam_chroot.so $pkgdir/usr/lib/security/pam_chroot.so
  install -D -m0644 chroot.conf $pkgdir/etc/security/chroot.conf
  install -D -m0644 CREDITS $pkgdir/usr/share/doc/pam_chroot/CREDITS
  install -D -m0644 options $pkgdir/usr/share/doc/pam_chroot/options
  install -D -m0644 README.history $pkgdir/usr/share/doc/pam_chroot/README.history
  install -D -m0644 TROUBLESHOOTING $pkgdir/usr/share/doc/pam_chroot/TROUBLESHOOTING
}
