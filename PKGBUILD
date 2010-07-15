# Maintainer: Ray Rashif <schivmeister@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.16.3
pkgrel=1
pkgdesc="Music education and ear training software"
arch=(i686 x86_64)
url="http://www.solfege.org/"
license=('GPL3')
depends=('pygtk' 'libgtkhtml')
makedepends=('ghostscript' 'gnome-doc-utils' 'librsvg' 'libxslt'
             'lilypond' 'swig' 'texinfo' 'txt2man' 'pkgconfig')
optdepends=('timidity++: Software MIDI support')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        solfege.desktop)
md5sums=('f8faabc581747582e37dea2bf14313f6' '22b89dcfd9e7c98ab238942139b8a970')
sha1sums=('3cc6937b5c2a418fcbac5202228b31a7f42710e0' '13699f1c3fc5f460951a6b75312dbd56219efb97')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/SWIG_VERSION="unknown"/SWIG_VERSION="1.3"/' configure
  ./configure --prefix=/usr \
              --sysconfdir=/etc

  make || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
