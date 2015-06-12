pkgname=libuecc
arch=(i686 x86_64)
pkgver=5
pkgrel=1
pkgdesc="Very small Elliptic Curve Cryptography library"
makedepends=('cmake')
url="http://git.universe-factory.net/libuecc/"
license=('BSD')
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --insecure -o %o %u')
source=("https://projects.universe-factory.net/attachments/download/80/${pkgname}-${pkgver}.tar.xz")
sha512sums=('f551c35ad4392a7b7a318a1317c0b70ee2b6f820aa6dd243f65d7944fc0778030c01e212242d81f9324c945125e30720e5999c101e78e6f61176966204db3d6b')

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
