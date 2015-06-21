# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com> 
_gitname=pam_p11
pkgname=pam_p11-git
pkgver=20131210
pkgrel=1
pkgdesc="PAM module for using crpytographic PKCS11 tokens such as smart cards and usb crypto tokens for local authentication."
arch=('i686' 'x86_64')
url="https://github.com/OpenSC/OpenSC/wiki/pam_p11-simple-RSA-authentication-with-PKCS%2311-modules"
license=('LGPL')
depends=('libp11')
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
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
