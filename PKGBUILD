# Maintainer: Shai Jo <shaiJo4U[äT]protonmail(.)com>
# Contributor: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
pkgname=libstorj
_pkgver=1.0.2
pkgver=v${_pkgver}
pkgrel=1
pkgdesc="Asynchronous C library and CLI for encrypted file transfer on the Storj network"
arch=('x86_64')
url="https://github.com/Storj/libstorj"
license=("GPL")
depends=("curl" "nettle" "json-c" "libuv")
makedepends=("git" "libmicrohttpd" "bsdmainutils")
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/Storj/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1d355f2663fd7701c49a5d696e38e1e9bfb48829fca314c47f043d8e3fa8468e')


build() {
  cd "$srcdir/${pkgname}-${_pkgver}"
  ./autogen.sh
  ./configure --with-pic --prefix=/usr
  make
}


check() {
  export TMPDIR=/tmp/
  "$srcdir/${pkgname}-${_pkgver}"/test/tests
}


package() {
  cd "$srcdir/${pkgname}-${_pkgver}"
        make DESTDIR="$pkgdir" install
}


package() {
  cd "$srcdir/${pkgname}-${_pkgver}"
  make DESTDIR="$pkgdir" install
  mv "${pkgdir}"/usr/bin/storj "${pkgdir}"/usr/bin/storj-cli
}
