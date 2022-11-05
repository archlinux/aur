# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mod_auth_gssapi
pkgver=1.6.5
pkgrel=2
pkgdesc="Kerberos authentication module for the Apache HTTP Server"
arch=(i686 x86_64)
url="https://github.com/gssapi/mod_auth_gssapi"
license=(custom)
depends=('apache>=2.4' krb5 openssl)
optdepends=('gss-ntlmssp: for NTLMSSP support')
makedepends=(gss-ntlmssp)
_commit=796000ae896ed56bd1e737255fcef2a067ae1ec6
source=("git+https://github.com/gssapi/mod_auth_gssapi.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
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
  install -Dm0755 src/.libs/mod_auth_gssapi.so \
                  "$pkgdir/usr/lib/httpd/modules/mod_auth_gssapi.so"
  install -Dm0644 COPYING \
                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
