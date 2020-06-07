## To enable GTK support, uncomment the additional dependency and "--enable-gtk".
## Do the same with audacious-plugins-git. Then run Audacious by "audacious --gtk".

_pkgname=audacious
pkgname=$_pkgname-gtk
pkgver=4.0.4
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('glib2' 'libsm' 'desktop-file-utils' 'unzip' 'libguess' 'qt5-base' 'hicolor-icon-theme')
provides=('audacious')
conflicts=('audacious')
install=$_pkgname.install
_tag=$_pkgname-$pkgver-gtk
source=("https://distfiles.audacious-media-player.org/audacious-4.0.4.tar.bz2")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -I m4
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-buildstamp='Arch Linux' \
    --enable-gtk \
    
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
 
