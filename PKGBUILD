# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnutls-git
pkgver=3.6.0.1.r11.g2b29963b5
pkgrel=1
pkgdesc="Provides useful functions commonly found on BSD systems"
arch=('i686' 'x86_64')
url="https://www.gnutls.org/"
license=('LGPL')
depends=('glibc' 'libidn2' 'libtasn1' 'libunistring' 'nettle' 'p11-kit' 'readline' 'zlib')
optdepends=('guile: for use with Guile bindings')
makedepends=('git')
provides=('gnutls')
conflicts=('gnutls')
source=("git+https://gitlab.com/gnutls/gnutls.git")
sha256sums=('SKIP')


pkgver() {
  cd "gnutls"

  git describe --long --tags | sed 's/^gnutls_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "gnutls"

  make autoreconf
  ./configure --prefix="/usr" \
    --with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit" \
    --enable-guile --with-guile-site-dir=no
  make
}

check() {
  cd "gnutls"

  #make check
}

package() {
  cd "gnutls"

  make DESTDIR="$pkgdir" install
}
