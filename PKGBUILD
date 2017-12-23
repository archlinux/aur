# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
_pkgname=audacity
pkgver=2.2.1.r31.gdb4528069
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://www.audacityteam.org/"
license=('GPL')
depends=('libmad' 'libid3tag' 'wxgtk3' 'lame' 'soundtouch'
         'ffmpeg' 'vamp-plugin-sdk' 'portsmf' 'twolame' 'suil' 'lilv')
makedepends=('cmake')
optdepends=('audacity-extras: nyquist plugins for audacity')
options=('!makeflags')
provides=('audacity')
conflicts=('audacity')
source=("$_pkgname::git+https://github.com/audacity/audacity.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

build() {
  cd "$srcdir/$_pkgname"
  WX_CONFIG=wx-config-gtk3 ./configure --prefix=/usr --with-libsamplerate
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
