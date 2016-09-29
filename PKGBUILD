# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Martin Stolpe <martinstolpe@gmail.com>

pkgname=lib32-libjpeg6-turbo
pkgver=1.5.1
pkgrel=1
pkgdesc='libjpeg derivative with accelerated baseline JPEG compression and decompression'
arch=('x86_64')
url='http://libjpeg-turbo.virtualgl.org/'
license=('BSD')
depends=('lib32-glibc')
makedepends=('nasm' 'gcc-multilib')
provides=('lib32-libjpeg6')
conflicts=('lib32-libjpeg6')
source=("http://downloads.sourceforge.net/project/libjpeg-turbo/${pkgver}/libjpeg-turbo-${pkgver}.tar.gz")
sha256sums=('41429d3d253017433f66e3d472b8c7d998491d2f41caa7306b8d9a6f2a2c666c')

build() {
  cd libjpeg-turbo-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --mandir='/usr/share/man' \
    --without-simd
  make
}

package() {
  cd libjpeg-turbo-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/pkgconfig,share}
  rm "${pkgdir}"/usr/lib32/lib{jpeg.{a,so},turbojpeg.{a,so*}}

  install -Dm 644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/lib32-libjpeg6-turbo/
}

# vim: ts=2 sw=2 et:
