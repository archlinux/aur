# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
_pkgname=audacity
pkgver=2.1.2.r1722.g2fef7f34
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://www.audacityteam.org/"
license=('GPL')
depends=('desktop-file-utils'
         'ffmpeg'
         'lame'
         'libid3tag'
         'libmad'
         'lilv'
         'portsmf'
         'sbsms'
         'soundtouch'
         'vamp-plugin-sdk'
         'webkitgtk2'
         'wxgtk')
optdepends=('audacity-extras: nyquist plugins for audacity')
makedepends=('cmake' 'python2' 'twolame')
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
  ./configure --prefix=/usr --with-libsamplerate
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
