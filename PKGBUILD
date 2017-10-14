# Maintainer:  VirtualTam    <virtualtam@flibidi.net>
#
# Based upon https://aur.archlinux.org/packages/audacity-git/
# Contributor: Proudzhu      <proudzhu.fdu at gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=darkaudacity-git
_gitname=audacity
pkgver=2.1.3.r1237.gec4838600
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://wiki.audacityteam.org/wiki/DarkAudacity"
license=('GPL')
depends=('libmad' 'libid3tag' 'libsoxr' 'lilv' 'portsmf' 'soundtouch'
         'suil' 'twolame' 'vamp-plugin-sdk' 'wxgtk')
makedepends=('cmake' 'git' 'python2')
options=('!makeflags')
provides=('audacity')
conflicts=('audacity')
source=(git://github.com/audacity/${_gitname}.git#branch=darkaudacity)
sha1sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --tags | sed 's/^\(Dark\)\?Audacity.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  ./configure --prefix=/usr --with-libsamplerate
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}
