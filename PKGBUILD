# Maintainer:  VirtualTam    <virtualtam@flibidi.net>
#
# Based upon https://aur.archlinux.org/packages/audacity-git/
# Contributor: Proudzhu      <proudzhu.fdu at gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=darkaudacity-git
_gitname=audacity
pkgver=2.1.2.r1445.g9e41323
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://www.darkaudacity.com/"
license=('GPL')
depends=('ffmpeg' 'desktop-file-utils' 'lame' 'libmad' 'libid3tag' 'lilv'
	  'portsmf' 'soundtouch' 'sbsms' 'vamp-plugin-sdk'
	  'webkitgtk2' 'wxgtk')
makedepends=('cmake' 'git' 'python2' 'twolame')
options=('!makeflags')
install=darkaudacity.install
provides=('audacity')
conflicts=('audacity')
source=(git://github.com/JamesCrook/${_gitname}.git#branch=darkaudacity
        audacity-ffmpeg.patch)
sha1sums=(SKIP
          5f1733a3802bcec7d9b54cb3ec8d7d81fc38fc61)

pkgver() {
  cd ${_gitname}
  git describe --tags | sed 's/^Audacity.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_gitname}
  patch -p1 -i ${srcdir}/audacity-ffmpeg.patch
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
