# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=3.0.0
pkgrel=1
pkgdesc='API Blueprint Parser'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('python2')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-v$pkgver.tar.gz")
sha1sums=('5a1167f14e9f8f11f10c9e3c342fd8f30b40f2b5')

build() {
  cd "${srcdir}/drafter-v${pkgver}"
  python2 configure --shared
  make
}

package() {
  cd "${srcdir}/drafter-v${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}/usr/bin" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/drafter.h "${pkgdir}/usr/include/drafter/drafter.h"
  install -Dm755 build/out/Release/lib.target/libdrafter.so "${pkgdir}/usr/lib/libdrafter.so.${pkgver}"
  ln -s "libdrafter.so.${pkgver}" "${pkgdir}/usr/lib/libdrafter.so"
}
