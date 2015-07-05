# Contributor: sp42b <sp42b|a_t|gmx.net>
# Contributor: AndyRTR <andreas.radke@freenet.de>

pkgname=dvbcut
pkgver=0.6.1
pkgrel=2
pkgdesc='Qt3 application for cutting parts out of DVB streams'
arch=('i686' 'x86_64')
url='http://dvbcut.sourceforge.net/'
license=('GPL')
depends=('desktop-file-utils' 'qt3' 'libao' 'libmad' 'a52dec')
optdepends=('mplayer: for video playback inside of DVBCUT')
install="$pkgname.install"
source=("http://www.mr511.de/dvbcut/$pkgname-$pkgver.tar.gz"
        'dvbcut-0.6.1-unistd.patch')
sha256sums=('053941abfd4cf8cfe0c86c78a1c22c9a6bf218cd9ae5158f8ec9181d7996ab2c'
            '8a7640e985efdc05920f59ce84c4639efbe8fafede4ab339178a8ea1f2d6bf62')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Patching..."
  for i in $srcdir/*.patch; do
    patch -Np1 -i "$i"
  done

  ./configure --prefix=/usr --with-qt3-include=/usr/include/qt3/
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 bin/dvbcut "$pkgdir/usr/bin/dvbcut"
  install -Dm644 dvbcut.1 "$pkgdir/usr/share/man/man1/dvbcut.1"
  install -Dm644 dvbcut.desktop "$pkgdir/usr/share/applications/dvbcut.desktop"
  install -Dm644 dvbcut.svg "$pkgdir/usr/share/dvbcut/icons/dvbcut.svg"
}

# vim:set ts=2 sw=2 et:
