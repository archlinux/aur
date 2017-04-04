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
pkgver=0.13.1
pkgrel=1
pkgdesc="Authentication module for Apache that authenticates the user against a SAML 2.0 IdP, and grants access to directories depending on attributes received from the IdP."
arch=('i686' 'x86_64')
url="https://github.com/UNINETT/mod_auth_mellon"
license=('LGPL')
depends=('apache' 'lasso')
source=("https://github.com/UNINETT/mod_auth_mellon/releases/download/v${pkgver}/mod_auth_mellon-${pkgver}.tar.gz")
sha512sums=('ad0479be8aa94404a832d11f7ead1f704d86cab2f11aa6f90b895be9b4028026f15ec8ee85260ca76f4a001c115ff14b4b7c9e8da74676a1f0295f6c2f0a1341')

build() {
  cd "$srcdir"/mod_auth_mellon-$pkgver
  apxs -L/usr/lib -I/usr/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libxml2 -I/usr/include/xmlsec1 -c mod_auth_mellon.c
}

package() {
  cd "$srcdir"/mod_auth_mellon-$pkgver
  install -Dm0755 .libs/mod_auth_mellon.so $pkgdir/usr/lib/httpd/modules/mod_auth_mellon.so
}
