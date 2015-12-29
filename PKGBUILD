# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=audacious
pkgname=${_pkgname}-qt5
pkgver=3.7.1
pkgrel=1
pkgdesc="Lightweight, advanced audio player (with qt5 interface)"
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('BSD')
depends=('qt5-base' 'libguess' 'libsm' 'audacious-plugins-qt5'
         'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('python2') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("${_pkgname}=${pkgver}")
conflicts=('audacious')
replaces=('audacious-player')
install=$_pkgname.install
source=(http://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2)
sha256sums=('c8366870aea21d5f4a5a282dee45fba99390e4e3d5164cd119e343f79e9ecbbf')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --with-buildstamp='Arch Linux' \
    --enable-qt \
    --disable-gtk
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
