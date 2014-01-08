# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=clanlib-23
pkgver=2.3.7
pkgrel=2
pkgdesc="A multi-platform game development library (legacy 2.3 branch)"
arch=('i686' 'x86_64')
url="http://clanlib.org/"
license=('zlib')
depends=('alsa-lib' 'libjpeg' 'libmikmod' 'libvorbis' 'fontconfig' 'pcre'
         'sqlite' 'libxrender' 'libgl')
makedepends=('mesa')
options=('!libtool')
source=("http://clanlib.org/download/releases-2.0/ClanLib-2.3.7.tgz")
sha256sums=('d46127c08103f48d15936ceb9f95b3dfb1ff8ccba667cef1b3f8e639cb2601c2')

build() {
  cd ClanLib-$pkgver

  ./autogen.sh
  # disable legacy gl1 renderer and documentation
  ./configure --prefix=/usr --disable-clanGL1 --disable-docs
  make
}

package() {
  cd ClanLib-$pkgver

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
