pkgname=libuecc
arch=(i686 x86_64)
pkgver=6
pkgrel=1
pkgdesc="Very small Elliptic Curve Cryptography library"
makedepends=('cmake')
url="http://git.universe-factory.net/libuecc/"
license=('BSD')
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --insecure -o %o %u')
source=("https://projects.universe-factory.net/attachments/download/83/${pkgname}-${pkgver}.tar.xz")
sha512sums=('72c34d7f54e00ac2ac732c770d975f14c217a1345aa83693053662be4b24f9eed18a4c417fe4491f8fa40b0cb0fa0961e5e271cb47753ef0378dbf13fd15be5a')

build() {
  mkdir -p "$srcdir/build-${pkgver}"
  cd "$srcdir/build-${pkgver}"

  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/build-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
