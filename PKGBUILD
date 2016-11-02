# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libjpeg6-turbo
pkgver=1.5.1
pkgrel=1
pkgdesc='libjpeg derivative with accelerated baseline JPEG compression and decompression'
arch=('i686' 'x86_64')
url='https://libjpeg-turbo.virtualgl.org/'
license=('BSD')
depends=('glibc')
makedepends=('nasm')
provides=('libjpeg6')
conflicts=('libjpeg6')
source=("https://downloads.sourceforge.net/project/libjpeg-turbo/${pkgver}/libjpeg-turbo-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('7D6293CC6378786E1B5C496885C7044E033FDE16') # libjpeg-turbo
sha256sums=('41429d3d253017433f66e3d472b8c7d998491d2f41caa7306b8d9a6f2a2c666c'
            'SKIP')

build() {
  cd libjpeg-turbo-${pkgver}

  ./configure \
    --prefix='/usr' \
    --mandir='/usr/share/man' \
    --without-simd
  make
}

package() {
  cd libjpeg-turbo-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/pkgconfig,share}
  rm "${pkgdir}"/usr/lib/lib{jpeg.{a,so},turbojpeg.{a,so*}}

  install -Dm 644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/libjpeg6-turbo/
}

# vim: ts=2 sw=2 et:
