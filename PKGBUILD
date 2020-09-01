pkgname=gss-ntlmssp
pkgver=0.9.0
pkgrel=1
pkgdesc="A GSSAPI Mechanism that implements NTLMSSP"
arch=(i686 x86_64)
url="https://github.com/gssapi/gss-ntlmssp"
license=(custom)
depends=(krb5 libunistring libwbclient openssl)
makedepends=(docbook-xsl doxygen git)
_commit=c22160db77b2e0cd931b0213feb3744348cfdace
source=("git+https://github.com/gssapi/gss-ntlmssp#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd gss-ntlmssp
  autoreconf -f -i
}

pkgver() {
  cd gss-ntlmssp
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

build() {
  cd gss-ntlmssp
  ./configure --prefix=/usr
  make
}

package() {
  cd gss-ntlmssp
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: ts=2:sw=2:et
