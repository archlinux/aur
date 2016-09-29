# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libjpeg6-turbo
pkgver=1.5.0
pkgrel=1
pkgdesc='libjpeg derivative with accelerated baseline JPEG compression and decompression'
arch=('i686' 'x86_64')
url='http://libjpeg-turbo.virtualgl.org/'
license=('BSD')
depends=('glibc')
makedepends=('nasm')
provides=('libjpeg6')
conflicts=('libjpeg6')
source=("http://downloads.sourceforge.net/project/libjpeg-turbo/${pkgver}/libjpeg-turbo-${pkgver}.tar.gz")
sha256sums=('9f397c31a67d2b00ee37597da25898b03eb282ccd87b135a50a69993b6a2035f')

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
