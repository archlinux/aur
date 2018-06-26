# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnurl-git
pkgver=7.60.0.r1.g5cf58a8cf
pkgrel=1
pkgdesc="gnurl is a fork of curl"
arch=('i686' 'x86_64')
url="https://gnunet.org/gnurl"
license=('MIT')
depends=('glibc' 'gnutls' 'krb5' 'libnghttp2' 'libpsl')
makedepends=('git')
provides=('gnurl')
conflicts=('gnurl')
options=('staticlibs')
source=("git+https://git.taler.net/gnurl.git")
sha256sums=('SKIP')


pkgver() {
  cd "gnurl"

  git describe --long --tags | sed 's/^gnurl-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gnurl"

  ./buildconf
  ./configure \
    --prefix="/usr" \
    --mandir="/usr/share/man" \
    --with-gssapi \
    --with-gnutls \
    --with-ca-bundle="/etc/ssl/certs/ca-certificates.crt" \
    --with-nghttp2
  make
}

check() {
  cd "gnurl"

  #make check
}

package() {
  cd "gnurl"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/gnurl/COPYING"
}
