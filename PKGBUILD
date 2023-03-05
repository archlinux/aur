# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=4.3
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('gtk3' 'glib2')
makedepends=('python') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
_commit=a68beaf3768765968c560be074a59b450aa1b69c
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2")
sha256sums=('27584dc845c7e70db8c9267990945f17322a1ecc80ff8b452e9ca916a0ce9091')

build() {
  cd "$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --enable-gtk3 \
    --disable-qt \
    --with-buildstamp='Arch Linux'
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
