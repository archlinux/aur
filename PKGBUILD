# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>
# Contributor: Jaël Champagne Gareau <gareau_jael@hotmail.com>
pkgname='dpaste'
pkgver=0.5.0
epoch=1
pkgrel=1
pkgdesc="A simple pastebin for light values (max 64KB) using OpenDHT distributed hash table."
arch=('x86_64')
license=('GPL3')
url='https://github.com/sim590/dpaste'
source=("git+https://github.com/sim590/dpaste#tag=$pkgver")
depends=('gnutls' 'libb64' 'libcurlpp-git' 'opendht' 'glibmm' 'gpgmepp')
makedepends=('git' 'nlohmann-json' 'msgpack-cxx' 'catch2')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/dpaste"
  ./autogen.sh
  ./configure --prefix=/usr --disable-debug --enable-tests
  make
}

check() {
  cd "${srcdir}/dpaste"
  make test
}

package() {
  cd "${srcdir}/dpaste"
  make DESTDIR="${pkgdir}" install
  # upstream installs the man page uncompressed; ship it gzipped as before.
  gzip -9 "${pkgdir}/usr/share/man/man1/dpaste.1"
}
# vim: ts=2 sw=2 et:
