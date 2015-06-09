# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname=lastfm
pkgver=2.1.30
pkgrel=8
pkgdesc="The official Last.fm desktop application suite"
arch=('any')
url="http://www.last.fm/"
license=('GPL3')
depends=('qt4>4.8' 'ruby' 'liblastfm' 'pkg-config' 'fftw' 'taglib' 'libsamplerate' 'libmad' 'libgpod' 'sqlite' 'phonon' 'phonon-qt4-vlc' 'ffmpeg' 'qtwebkit')
makedepends=()
source=(Last.fm-$pkgver.tar.bz2::http://www.last.fm/download/linux
    glibfix.patch
    lastfm-scrobbler
    LAV_Source_fix.patch
    lastfm-scrobbler.desktop
    cast-bug.patch)
conflicts=(lastfm-git
    lastfm-mpd-cli
    lastfm-msk
    lastfm-msk-light)

provides=(lastfm)

#install=$pkgname.install

build() {
  cd $srcdir/lastfm-desktop-$pkgver
  patch -Np1 -i ../glibfix.patch
  patch -Np1 -i ../LAV_Source_fix.patch
  patch -Np1 -i ../cast-bug.patch
  qmake-qt4 -r
  make

}

package() {
  cd "$srcdir/lastfm-desktop-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/opt/last.fm/css
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp -R _bin $pkgdir/opt/last.fm/bin
  cp "app/client/Last.fm Scrobbler.css" $pkgdir/opt/last.fm/css
  install -m755 $srcdir/lastfm-scrobbler $pkgdir/usr/bin/lastfm-scrobbler
  install -D -m644 "${srcdir}/lastfm-scrobbler.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m644 "${srcdir}/lastfm-desktop-$pkgver/app/client/audioscrobbler.ico" "${pkgdir}/usr/share/pixmaps/audioscrobbler.ico"
}

md5sums=('5f13a2f114143a861c6f2572cb152d24'
         '2d77a2d19dd5569dc5213ac99b813e52'
         'a5d3b0b4026d4694a580b099c5f82932'
         '3ac4b2bcf2c7121cdc71cbc13bb6e2af'
         'fa62e46c1085e8893545e81e063a6a61'
         '1571a79e34558688f25e17f069b070c2')
