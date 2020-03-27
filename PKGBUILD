# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# To enable GTK support, uncomment the additional dependency and "--enable-gtk".
# Do the same with audacious-plugins-git. Then run Audacious by "audacious --gtk".

_pkgname=audacious
pkgname="$_pkgname-git"
_pkgver=4.1
pkgver=4.1.r9041.ef184ee52
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('glib2' 'qt5-base') # 'gtk2')
makedepends=('git' 'python') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git://github.com/audacious-media-player/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  autoreconf -I m4
  ./configure \
    --prefix=/usr \
    --with-buildstamp="$(date +%x)" \
  # --enable-gtk \

  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
