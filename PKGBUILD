pkgname=gss-ntlmssp
pkgver=0.8.0.r3.g2251a72
pkgrel=1
pkgdesc="A GSSAPI Mechanism that implements NTLMSSP"
arch=(i686 x86_64)
url="https://pagure.io/gssntlmssp"
license=(custom)
depends=(krb5 libunistring libwbclient openssl)
makedepends=(docbook-xsl doxygen git)
_commit=2251a7224f488ac20604b6a12ccfe30d99170ef2
source=("git+https://pagure.io/gssntlmssp.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd gssntlmssp
  autoreconf -f -i
}

pkgver() {
  cd gssntlmssp
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

build() {
  cd gssntlmssp
  ./configure --prefix=/usr
  make
}

package() {
  cd gssntlmssp
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: ts=2:sw=2:et
