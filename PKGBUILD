# Maintainer: Nikola Ivačič <nikola.ivacic@dropchop.com>
### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=apache-mod_auth_mellon
pkgver=0.18.1
pkgrel=1
pkgdesc="Authentication module for Apache that authenticates the user against a SAML 2.0 IdP, and grants access to directories depending on attributes received from the IdP."
arch=('i686' 'x86_64')
url="https://github.com/latchset/mod_auth_mellon"
license=('LGPL')
depends=('apache' 'lasso>=2.8.0' 'curl' 'openssl>=3.0.0')
makedepends=('apache' 'lasso>=2.8.0' 'curl')
source=("https://github.com/latchset/mod_auth_mellon/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fab00f1cb00eb9d3f083efaff7ef3b356c4816c996ef86efb495955cd6ee9abb9433d5193e067840a8f0bd555c5ffbab1f8b4a4f3c1e3c09d36b34346a224696')

build() {
  cd "$srcdir"/mod_auth_mellon-$pkgver
  ./autogen.sh
  ./configure
  apxs -L/usr/lib -I/usr/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libxml2 -I/usr/include/xmlsec1 -llasso -lcurl -c mod_auth_mellon.c auth_mellon_*.c
}

package() {
  cd "$srcdir"/mod_auth_mellon-$pkgver
  install -Dm0755 .libs/mod_auth_mellon.so $pkgdir/usr/lib/httpd/modules/mod_auth_mellon.so
}
