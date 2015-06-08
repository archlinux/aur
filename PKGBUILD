# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Richard Jackson <rj@iinet.net.au>
pkgname=abiword-3.x-gtk2
_pkgname=abiword
pkgver=3.0.1
pkgrel=2
pkgdesc='Fully-featured word processor, GTk2, No plugins, Lite version'
arch=('i686' 'x86_64')
license=('GPL')
depends=('fribidi' 'wv' 'librsvg' 'enchant' 'desktop-file-utils' 'gtk2' 'libxslt')
makedepends=('pkgconfig' 'boost')
install=$pkgname.install
conflicts=('abiword' 'abiword-plugins')
url='http://www.abisource.com'
source=("$_pkgname-$pkgver.tar.gz::http://abisource.com/downloads/$_pkgname/$pkgver/source/$_pkgname-$pkgver.tar.gz")
sha256sums=('e094f6fbf0afc5c5538b4894888e7c346f8ee8f49c9d24821dd696d0734865c6')

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-gtk2 \
    --enable-clipart \
    --enable-templates \
    --without-redland \
    --without-libical \
    --disable-builtin-plugins \
    --disable-default-plugins \
    --disable-collab-backend-service \
    --disable-collab-backend-tcp
  make -C goffice-bits2
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
