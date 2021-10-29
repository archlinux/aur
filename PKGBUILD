# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.7.0
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('GPL3')
depends=("liblcf>=${pkgver:0:5}" 'sdl2' 'pixman' 'fmt' 'harfbuzz' 'libvorbis'
         'mpg123' 'libsndfile' 'speexdsp' 'wildmidi' 'opusfile')
optdepends=('wine: for installing the run time packages (RTP)'
            'libxmp: decoder for tracker music, used by few games'
            'alsa-lib: native MIDI playback'
            'fluidsynth: better MIDI decoder'
            'rpg2000-rtp: run time package for some 2k games'
            'rpg2003-rtp: run time package for some 2k3 games')
install=$pkgname.install
source=("https://easyrpg.org/downloads/player/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('12149f89cc84f3a7f1b412023296cf42041f314d73f683bc6775e7274a1c9fbc')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --enable-fmmidi
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
