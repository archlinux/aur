# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mod_auth_gssapi
pkgver=1.6.1
pkgrel=1
pkgdesc="Kerberos authentication module for the Apache HTTP Server"
arch=(i686 x86_64)
url="https://github.com/gssapi/mod_auth_gssapi"
license=(custom)
depends=(apache krb5)
optdepends=('gss-ntlmssp: for NTLMSSP support')
makedepends=(gss-ntlmssp)
_commit=d49615a95fd99e1eda8a7bf54e7f7216c4a7e6b1
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
