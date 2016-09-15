# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: 4javier <4_javiereg_4atgmaildotcom>
pkgname=libvpx-1.5
_pkgname=libvpx
pkgver=1.5.0
pkgrel=1
pkgdesc='The VP8 Codec SDK (version 1.5, provides libvpx.so.3)'
arch=('i686' 'x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('glibc')
makedepends=('yasm' 'git')
conflicts=('libvpx<1.6')
source=("http://storage.googleapis.com/downloads.webmproject.org/releases/webm/$_pkgname-$pkgver.tar.bz2")
sha256sums=('306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797')


build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --enable-vp8 \
    --enable-vp9 \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --disable-static \
    --enable-postproc \
    --enable-pic \
    --disable-install-docs \
    --disable-install-bins \
    --disable-install-srcs
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DIST_DIR="${pkgdir}/usr" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove useless files, already provided by libvpx package
  rm "${pkgdir}/usr/lib/pkgconfig/vpx.pc"
  rmdir "${pkgdir}/usr/lib/pkgconfig"
  rm "${pkgdir}/usr/lib/libvpx.so"
  rm -rf "${pkgdir}/usr/include/vpx"
  rmdir "${pkgdir}/usr/include"
}
