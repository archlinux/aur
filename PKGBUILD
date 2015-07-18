# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=guvcview-git
_gitname=guvcview-git-master
pkgver=v2.0.1.r43.g8f6cc14
pkgrel=1
pkgdesc="A video viewer and capturer for the linux uvc driver"
arch=('i686' 'x86_64')
url="http://guvcview.sourceforge.net/"
license=('GPL')
depends=('gtk3' 'ffmpeg' 'portaudio' 'sdl2' 'gsl')
makedepends=('git' 'intltool')
optdepends=('pulseaudio: for PulseAudio support')
provides=('guvcview')
conflicts=('guvcview')
source=("$pkgname::git://git.code.sf.net/p/guvcview/git-master"
        "v4l2_core.patch")
sha1sums=('SKIP'
          'b92920fc6545209045fe8203ee23678549ad749b')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  export CPPFLAGS+=" -O2 "
  ./bootstrap.sh --prefix=/usr
  patch -p1 -i $startdir/v4l2_core.patch
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
