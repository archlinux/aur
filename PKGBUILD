# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=openssl-pkcs11-export
pkgver=1.0.0
pkgrel=1
pkgdesc="PKCS#11 software token providing access to OpenSSL 'engine' keys"
arch=(i686 x86_64)
url="https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl-pkcs11-export.git"
license=(LGPL2.1)
depends=(openssl)
makedepends=(asciidoc git gnutls p11-kit)
_commit=310acdb8a592bde39ee2a20d696410ef02df4108
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl-pkcs11-export.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
