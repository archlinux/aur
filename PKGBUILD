# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Tobias Frilling <tobias@frilling-online.de>

pkgname=guvcview-qt5-git
pkgver=2.0.4.r33.gf618a10
pkgrel=1
pkgdesc="Video viewer and capturer for the linux uvc driver, Qt5-version"
arch=('i686' 'x86_64')
url="http://guvcview.sourceforge.net/"
license=('GPL')
depends=('ffmpeg'
	'gsl'
	'libpng'
	'libusb'
	'portaudio'
	'qt5-base'
	'sfml'
	'sdl2')
makedepends=('git'
	'intltool'
	'qt5-tools')
optdepends=('pulseaudio: for PulseAudio support')
provides=('guvcview')
conflicts=('guvcview')
source=("$pkgname::git://git.code.sf.net/p/guvcview/git-master")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  export CPPFLAGS+=" -O2 "
  export CXXFLAGS="-std=c++11"
  ./bootstrap.sh --prefix=/usr
  ./configure --prefix=/usr \
    --disable-gtk3 \
    --enable-qt5 \
    --disable-debian-menu \
    --enable-sfml
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

