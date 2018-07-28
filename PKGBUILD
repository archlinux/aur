# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=audacious
pkgname=${_pkgname}-qt5
pkgver=3.10+beta1
pkgrel=1
pkgdesc="Lightweight, advanced audio player (with qt5 interface)"
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('BSD')
depends=('qt5-base' 'libguess' 'libsm' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('python') # for gdbus-codegen
optdepends=('unzip: zipped skins support'
            'audacious-plugins-qt5: many helpful plugins')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('audacious-player')
source=(https://distfiles.audacious-media-player.org/$_pkgname-${pkgver/+/-}.tar.bz2)
sha256sums=('3a3ea429cbfcdd008bec3edd9747beba0afa9510ab2f6430a251f33d9b8c466f')

build() {
  cd "$srcdir/$_pkgname-${pkgver/+/-}"

  ./configure \
    --prefix=/usr \
    --with-buildstamp='Arch Linux' \
    --enable-qt \
    --disable-gtk
  make
}

package() {
  cd "$srcdir/$_pkgname-${pkgver/+/-}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
