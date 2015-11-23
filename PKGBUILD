# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=zimg
pkgver=2.0.1a
pkgrel=1
pkgdesc='Scaling, colorspace conversion, and dithering library'
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171334'
license=('custom:WTFPL')
depends=('gcc-libs' 'glibc')
provides=('vapoursynth-plugin-zimg')
options=('!emptydirs')
source=("zimg-${pkgver}.tar.gz::https://github.com/sekrit-twc/zimg/archive/release-${pkgver}.tar.gz")
md5sums=('29a17b4af2ca9606bf46fe8c7408a36c')

build() {
  cd zimg-release-${pkgver}

  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --enable-x86simd
  make
}

package(){
  cd zimg-release-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/lib/vapoursynth
  mv "${pkgdir}"/usr/lib/{zimg/,vapoursynth/lib}vszimg.so

  install -dm 755 "${pkgdir}"/usr/share/licenses/zimg
  install -m 644 COPYING "${pkgdir}"/usr/share/licenses/zimg/
}

# vim: ts=2 sw=2 et:
