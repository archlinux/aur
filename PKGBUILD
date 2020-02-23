# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=cpdup
pkgver=1.20
pkgrel=1
pkgdesc="Tool to mirror filesystems retaining permissions, flags, ownership, and utimes"
url="https://github.com/DragonFlyBSD/cpdup"
license=('BSD')
arch=('i686' 'x86_64')
depends=('libbsd')
makedepends=('pkg-config')
source=(https://github.com/DragonFlyBSD/cpdup/archive/v${pkgver}.tar.gz)
sha256sums=('b8b3edb51c8f57e16f37bb6e4261214af2fdab4e7a13067dd5d47d46f55b1c93')

prepare() {
  cd "${pkgname}-${pkgver}"
  # HACK I can't use -D since __unused is used as variable name in some system headers
  sed -i 's/__unused/__attribute__((__unused__))/' *.c
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
