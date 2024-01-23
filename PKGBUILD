pkgname=pkcs11-provider
#_commit=58040b4e32975cc1d7f39e424ee7b0097cd11311
pkgver=0.3
pkgrel=1
pkgdesc="OpenSSL 3.0 provider for PKCS#11 hardware-backed private keys"
url="https://github.com/latchset/pkcs11-provider"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  "openssl>=3.0.7"
  p11-kit
)
makedepends=(
  autoconf-archive
  automake
  gcc
  git
  libtool
)
checkdepends=(
  expect
  gnutls
  nss
  opensc
  softhsm
)
#source=("git+https://github.com/latchset/pkcs11-provider#commit=$_commit")
source=("https://github.com/latchset/pkcs11-provider/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "https://github.com/latchset/pkcs11-provider/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('72275ddf59787c810d13c6edc756ba57db014ca9d1613e09fd22302b7a725216'
            'SKIP')
validpgpkeys=('7C7BD146943B206BB645B64594EAD67E004B65AB')

#pkgver() {
#  cd $pkgname
#  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
#}
#
#prepare() {
#  cd $pkgname
#  autoreconf -fi
#}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
