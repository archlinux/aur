# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Moritz Lipp <mlq at pwmt dot org>

pkgname=libfiu
pkgver=1.00
pkgrel=1
pkgdesc="userspace fault injection framework"
arch=('i686' 'x86_64')
url="https://blitiri.com.ar/p/libfiu/"
license=('custom')
depends=('sh')
makedepends=('python')
source=("https://blitiri.com.ar/p/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0d9141d793154bb258be5eba0bba2303ee26d5abd92c3ee9baae7a6e03fdf3d3')

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
