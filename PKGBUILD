# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=guvcview-git
_gitname=guvcview-git-master
pkgver=v2.0.6.r4.g73dacab
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
source=("$pkgname::git://git.code.sf.net/p/guvcview/git-master")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  export CPPFLAGS+=" -O2 "
  ./bootstrap.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
