# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Martin Stolpe <martinstolpe@gmail.com>

pkgname=lib32-libjpeg6-turbo
pkgver=1.3.1
pkgrel=2
pkgdesc='libjpeg derivative with accelerated baseline JPEG compression and decompression'
arch=('x86_64')
url='http://libjpeg-turbo.virtualgl.org/'
license=('BSD')
depends=('lib32-glibc')
makedepends=('nasm' 'gcc-multilib')
provides=('lib32-libjpeg6')
conflicts=('lib32-libjpeg6')
source=("http://sourceforge.net/projects/libjpeg-turbo/files/${pkgver}/libjpeg-turbo-${pkgver}.tar.gz")
sha256sums=('c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9')

build() {
  cd libjpeg-turbo-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
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
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm "${pkgdir}"/usr/lib32/lib{jpeg.so,turbojpeg.so*}

  install -dm 755 "${pkgdir}"/usr/share/licenses/lib32-libjpeg6-turbo
  install -m 644 README{,-turbo.txt} "${pkgdir}"/usr/share/licenses/lib32-libjpeg6-turbo/
}

# vim: ts=2 sw=2 et:
