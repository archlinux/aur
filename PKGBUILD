# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
pkgname=libstorj-git
pkgver=v1.0.1.r5.gd5c5393
pkgrel=1
pkgdesc="Asynchronous C library and CLI for encrypted file transfer on the Storj network"
arch=('any')
url="https://github.com/Storj/libstorj"
license=("GPL")
depends=("libcurl-gnutls" "nettle" "libjson" "libuv")
makedepends=("git" "libmicrohttpd" "bsdmainutils")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags | sed 's/ver_//;s/_/./g;s/-/.r/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname}"
  ./autogen.sh
  ./configure --with-pic --prefix=/usr
  make
}


check() {
  export TMPDIR=/tmp/
  "$srcdir/${pkgname}"/test/tests
}

package() {
  cd "$srcdir/${pkgname}"
        make DESTDIR="$pkgdir" install
}

package() {
  cd "$srcdir/${pkgname}"  
  make DESTDIR="$pkgdir" install
  mv "${pkgdir}"/usr/bin/storj "${pkgdir}"/usr/bin/storj-cli
  
}
