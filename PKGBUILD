pkgname=pkcs11-provider
pkgver=r207.g5b0d093
pkgrel=1
pkgdesc="OpenSSL 3.0 provider for PKCS#11 hardware-backed private keys"
url="https://github.com/latchset/pkcs11-provider"
arch=(x86_64)
license=(Apache)
depends=(
  "openssl>=3.0.5"
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
  nss
  softhsm
)
_commit=5b0d09341aca440b44b321db340f92e0e752f03b
source=("git+https://github.com/latchset/pkcs11-provider#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
