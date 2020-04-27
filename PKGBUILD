# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.6.2
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('GPL3')
depends=("liblcf>=$pkgver" 'sdl2_mixer' 'pixman' 'freetype2' 'libvorbis' 'mpg123'
         'libsndfile' 'speexdsp' 'wildmidi')
optdepends=('wine: for installing the run time packages (RTP)'
            'libxmp: decoder for tracker music, used by few games'
            'rpg2000-rtp: run time package for some 2k games'
            'rpg2003-rtp: run time package for some 2k3 games')
install=$pkgname.install
source=("https://easyrpg.org/downloads/player/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3550200c4b7c42fa7bd5774de5016b48d5660cc33d1614f174f474702ee253b9')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --enable-fmmidi=fallback
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
