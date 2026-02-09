# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Moritz Lipp <mlq at pwmt dot org>

pkgname=libfiu
pkgver=1.2
pkgrel=1
pkgdesc="userspace fault injection framework"
arch=('i686' 'x86_64')
url="https://blitiri.com.ar/p/libfiu/"
license=('custom')
depends=('bash')
makedepends=('python')
source=("https://blitiri.com.ar/p/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('353ab3b50709cdd91522d7e4bb7ff800b27a97f72b989e22ce426c6de2669674')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=${pkgdir}/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=${pkgdir}/usr install

  # Fix paths
  sed -e "s|${pkgdir}||g" \
    -i $pkgdir/usr/lib/pkgconfig/libfiu.pc \
    -i $pkgdir/usr/bin/fiu-run

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
