# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgbasename=mpg123
pkgname=lib32-$_pkgbasename
pkgver=1.26.2
pkgrel=1
pkgdesc="A console based real time MPEG Audio Player for Layer 1, 2 and 3 (32-bit)"
arch=('x86_64')
url="http://sourceforge.net/projects/mpg123"
license=('LGPL2.1')
depends=('lib32-glibc' 'lib32-libtool' 'lib32-alsa-lib' $_pkgbasename)
makedepends=('lib32-sdl' gcc-multilib libtool-multilib)
optdepends=('lib32-sdl: for additional audio support')
source=(https://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.bz2{,.sig})
sha512sums=('aa63fcb08b243a1e09f7701b3d84a19d7412a87253d54d49f014fdb9e75bbc81d152a41ed750fccde901453929b2a001585a7645351b41845ad205c17a73dcc9'
            'SKIP')
validpgpkeys=(D021FF8ECF4BE09719D61A27231C4CBC60D5CAFE)

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  ./configure --prefix=/usr --with-audio="alsa sdl" --with-cpu=i586 --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
