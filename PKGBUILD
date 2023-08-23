# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.8
pkgrel=2
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
source=("https://easyrpg.org/downloads/player/$pkgver/$pkgname-$pkgver.tar.xz"
        "$pkgname-$pkgver-fmt-string_view-api.patch")
sha256sums=('06e6d034348d1c52993d0be6b88fc3502a6c7718e366f691401539d5a2195c79'
            '723d82c9ae8e38d3e56684c4115debb6af140f1db648871b355fbb88e9b24759')

prepare() {
  patch -d $pkgname-$pkgver -p1 < $pkgname-$pkgver-fmt-string_view-api.patch
}

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
