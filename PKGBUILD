# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com> 
_gitname=pam_p11
pkgname=pam_p11-git
pkgver=pam_p11.0.6.0.r0.ga6d8605
pkgrel=4
pkgdesc="PAM module for using crpytographic PKCS11 tokens such as smart cards and usb crypto tokens for local authentication."
arch=('i686' 'x86_64')
url="https://github.com/OpenSC/OpenSC/wiki/pam_p11-simple-RSA-authentication-with-PKCS%2311-modules"
license=('LGPL-2.1-or-later')
depends=('glibc' 'pam' 'libp11' 'openssl')
makedepends=('git')
provides=('pam_p11')
source=('git+https://github.com/OpenSC/pam_p11.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p m4
  ./bootstrap
  ./configure --libdir=/usr/lib --datarootdir=/usr/share --disable-static
  make
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
