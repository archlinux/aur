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
pkgver=0.19.1
pkgrel=1
pkgdesc="Authentication module for Apache that authenticates the user against a SAML 2.0 IdP, and grants access to directories depending on attributes received from the IdP."
arch=('i686' 'x86_64')
url="https://github.com/latchset/mod_auth_mellon"
license=('LGPL')
depends=('apache' 'lasso>=2.8.0' 'curl' 'openssl>=3.0.0')
makedepends=('apache' 'lasso>=2.8.0' 'curl')
source=("https://github.com/latchset/mod_auth_mellon/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d512cf0eb52b91c7f6671e5e9425eb62263e58e0d3c5daea0fab13315e6310e228fd2f736a1793dc67037dbd717727a61908eb87e7b6654d7da4c62434c9301d')

build() {
  cd "$srcdir"/mod_auth_mellon-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/mod_auth_mellon-$pkgver
  install -Dm0755 .libs/mod_auth_mellon.so $pkgdir/usr/lib/httpd/modules/mod_auth_mellon.so
}
