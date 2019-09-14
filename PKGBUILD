# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=scute
pkgver=1.6.0
pkgrel=1
pkgdesc="GnuPG PKCS#11 module for using OpenPGP smartcards with X.509"
arch=(i686 x86_64)
url="https://github.com/gpg/scute"
license=(GPL2)
depends=(gnupg)
makedepends=(texinfo)
source=("https://gnupg.org/ftp/gcrypt/scute/scute-$pkgver.tar.bz2"
        "https://gnupg.org/ftp/gcrypt/scute/scute-$pkgver.tar.bz2.sig")
sha256sums=('511be523407590a586b7d61b5985af965dd91901b75d9650b55e9ae1d86d0ab0'
            'SKIP')
validpgpkeys=('4FA2082362FE73AD03B88830A8DC7067E25FBABB')

build() {
  cd scute-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd scute-$pkgver
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/lib/pkcs11
  ln -s ../scute.so "$pkgdir"/usr/lib/pkcs11/scute.so

  mkdir -p "$pkgdir"/usr/share/p11-kit/modules
  echo "module: scute.so" > "$pkgdir"/usr/share/p11-kit/modules/scute.module
}

# vim: ts=2:sw=2:et
