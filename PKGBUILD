# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libvpx-1.3
pkgver=1.3.0
pkgrel=1
pkgdesc='The VP8 Codec SDK (version 1.3, provides libvpx.so.1)'
arch=('i686' 'x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('glibc')
makedepends=('yasm' 'git')
conflicts=('libvpx<1.4')
source=("${pkgname}"::"git+http://code.google.com/p/webm.libvpx#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${pkgname}"
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
  cd "${pkgname}"
  make DIST_DIR="${pkgdir}/usr" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove useless files, already provided by libvpx package
  rm "${pkgdir}/usr/lib/pkgconfig/vpx.pc"
  rmdir "${pkgdir}/usr/lib/pkgconfig"
  rm "${pkgdir}/usr/lib/libvpx.so"
  rm -rf "${pkgdir}/usr/include/vpx"
  rmdir "${pkgdir}/usr/include"
}
