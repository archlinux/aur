# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=ntpclient
pkgver=2015.365
pkgrel=2
pkgdesc='A simple NTP (RFC-1305) client'
url='http://doolittle.icarus.com/ntpclient/'
arch=(x86_64 i686)
depends=(glibc)
license=(GPL2)
source=(http://doolittle.icarus.com/ntpclient/ntpclient_${pkgver/./_}.tar.gz
        newkernel.patch)
sha1sums=('7513df5b5b64797c5fac27d7c1161f53a4675b26'
          '169d1938f31247d869cd09c42e50a2ffcca9ef7a')

prepare() {
  cd ntpclient-${pkgver%.*}
  patch < ../newkernel.patch
}

build() {
  cd ntpclient-${pkgver%.*}
  make ntpclient adjtimex
}

package() {
  cd ntpclient-${pkgver%.*}
  install -t $pkgdir/usr/bin -D -m755 ntpclient adjtimex
  install -t $pkgdir/usr/share/man/man1 -D -m644 ntpclient.1
}
