# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=4.6.2
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD-2-Clause')
depends=('gtk3' 'glib2')
makedepends=('meson' 'glib2-devel') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2")
sha256sums=('af4c68b7dd09304d382df18616aecd843c8efa4e4eef31bfc76abce465271c83')

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
