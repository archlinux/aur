# Contributor: Bitts311 <oceanmail311@gmail.com>

pkgname=audacious-gtk
_pkgname=audacious
pkgver=4.1.beta1
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality - latest stable release"
arch=('x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('glib2' 'libsm' 'desktop-file-utils' 'unzip' 'libguess' 'qt5-base' 'hicolor-icon-theme')
provides=('audacious')
conflicts=('audacious')
install=$_pkgname.install
_tag=$_pkgname-$pkgver-gtk
source=("https://distfiles.audacious-media-player.org/audacious-4.1-beta1.tar.bz2")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname-4.1-beta1"
  autoreconf -I m4
}

build() {
  cd "$srcdir/$_pkgname-4.1-beta1"

  if [ "$_use_meson" = 1 ]; then
    arch-meson build -D buildstamp="$_buildstamp"
    meson compile -C build
  else
    ./autogen.sh
    ./configure \
      --prefix=/usr \
      --with-buildstamp="$_buildstamp"
    make
  fi
}

package() {
  cd "$srcdir/$_pkgname-4.1-beta1"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
 
