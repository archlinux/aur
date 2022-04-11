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
pkgver=0.18.0
pkgrel=2
pkgdesc="Authentication module for Apache that authenticates the user against a SAML 2.0 IdP, and grants access to directories depending on attributes received from the IdP."
arch=('i686' 'x86_64')
url="https://github.com/latchset/mod_auth_mellon"
license=('LGPL')
depends=('apache' 'lasso>=2.8.0' 'curl')
makedepends=('apache' 'lasso>=2.8.0' 'curl')
source=("https://github.com/latchset/mod_auth_mellon/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('477ac302fda9ed33b2ca51e88379250a41cc85111e71cacc8ba9f16cd8a2b63af6393fb038fc8f5c211b97926ef368c5989c92570c2e3c9eae072c7b4d32d7d5')

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
