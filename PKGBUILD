# Maintainer: P. A. López-Valencia <https://aur.archlinux.org/users/vorbote/>

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.9
pkgrel=1
pkgdesc="Special private freetype library to prevent autohinting in LibreOffice"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
depends=('zlib' 'bzip2' 'libpng' 'harfbuzz' 'libreoffice')
options=(!docs)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        lo-freetype.patch)
sha384sums=('ef34e1189b3fcd1b539c32a19ebbec0aedb9906a74ce27646727652b26c9d6b1f159778a01f3dcc4d7814d473fd29f6f'
            'SKIP'
            'd8f6ea143758ce404501ce06d8294ee907c98438a103d61c70cbe697aafdb732549557ecece04066b37f8eb1750fea5e')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../lo-freetype.patch
}

build() {
  cd freetype-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd freetype-$pkgver

  install -Dm755 "$srcdir/freetype-$pkgver/objs/.libs/libfreetype.so" "$pkgdir/usr/lib/libreoffice/program/libfreetype.so.6"
}
