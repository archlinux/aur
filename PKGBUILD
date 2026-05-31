# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=4.6
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('gtk3' 'glib2')
makedepends=('meson' 'glib2-devel') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2")
sha256sums=('03988a6a114e46f91dabcd4d0dae29fcad19f6029e3c28737938d1bd525979dd')

build() {
  arch-meson $_pkgname-$pkgver build \
    -Dqt=false \
    -Dbuildstamp='Arch Linux'
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
