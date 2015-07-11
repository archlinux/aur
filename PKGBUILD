# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mod_auth_gssapi
pkgver=1.3.0
pkgrel=1
pkgdesc="Kerberos authentication module for the Apache HTTP Server"
arch=(i686 x86_64)
url="https://github.com/modauthgssapi/mod_auth_gssapi"
license=(custom)
depends=('apache>=2.4' 'krb5>=1.11')
source=("git+https://github.com/modauthgssapi/mod_auth_gssapi.git#commit=7c480774b48253c90fbcfee2915a113b7933c4a5")
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
  install -Dm0755 "src/.libs/mod_auth_gssapi.so" \
                  "$pkgdir/usr/lib/httpd/modules/mod_auth_gssapi.so"
  install -Dm0644 "COPYING" \
                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
