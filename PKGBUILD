# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=4.2
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('gtk3' 'glib2')
makedepends=('git' 'python') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
_commit=a68beaf3768765968c560be074a59b450aa1b69c
source=("git+https://github.com/audacious-media-player/$_pkgname.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  autoreconf -I m4
}

build() {
  cd "$_pkgname"
  ./configure \
    --prefix=/usr \
    --disable-qt \
    --with-buildstamp='Arch Linux'
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
