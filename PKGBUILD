# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=guvcview-git
_gitname=guvcview-git-master
pkgver=v2.0.3.r32.gaa07ea1
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
        "pix_fmt.patch")
sha1sums=('SKIP'
          '6e1f8b0dbf9f4a301e3024f7d30010609bb2de89')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir
  patch -p1 -i pix_fmt.patch
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
