# Maintainer: P. A. López-Valencia <https://aur.archlinux.org/users/vorbote/>

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.11.0
pkgrel=1
pkgdesc="Special private freetype library to prevent autohinting in LibreOffice"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
depends=('zlib' 'bzip2' 'libpng' 'harfbuzz' 'libreoffice')
options=(!docs)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz{,.sig}
        lo-freetype.patch)
b2sums=('ed14b566b8ac31a85dde4c8d26dd8b001f6a2cb506cfafd550b31bb90a3f592376d6f9f6bbe1b6c21e27e4ad23d0eafa7ea886211174b978e101fb6a77261324'
        'SKIP'
        '031a8f422cdd2b9ae994e7ff9b32594aae28e11996e4d18b64f2a395be19310be1339fea5342be5127b7acb410072b2cf4abd9ef5121fc13f2ed8173f2e4f36d')
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
