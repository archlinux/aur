# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=musikernel-git
pkgver=2.16.02.1.r1.g86b1d57
pkgrel=1
pkgdesc="DAW and suite of instrument & effect plugins"
arch=('i686' 'x86_64')
url="https://github.com/j3ffhubb/musikernel"
license=('GPL3')
depends=('ffmpeg' 'lame' 'libisofs' 'liblo' 'portaudio' 'portmidi'
         'python-numpy' 'python-pyqt5'
         'rubberband' 'sbsms' 'squashfs-tools' 'vorbis-tools')
makedepends=('gdb' 'git')
provides=('musikernel')
_gitname="musikernel"
source=(git://github.com/j3ffhubb/musikernel.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/^musikernel//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${_gitname}/src
  make PREFIX="/usr"
}

package() {
  cd ${_gitname}/src
  make DESTDIR=${pkgdir} install
  # remove setuid/setgid
  chmod 755 ${pkgdir}/usr/bin/musikernel2-engine
}
