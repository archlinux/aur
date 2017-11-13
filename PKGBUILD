# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=scute
pkgver=1.5.0
pkgrel=2
pkgdesc="GnuPG PKCS#11 module for using OpenPGP smartcards with X.509"
arch=(i686 x86_64)
url="https://github.com/gpg/scute"
license=(GPL2)
depends=(gnupg)
makedepends=(texinfo)
source=("https://gnupg.org/ftp/gcrypt/scute/scute-1.5.0.tar.bz2"
        "https://gnupg.org/ftp/gcrypt/scute/scute-1.5.0.tar.bz2.sig")
sha256sums=('6199d28d8ce17f979f67059b461ab55a2276fc390eaa45e5ce6ff615bf81ab96'
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
