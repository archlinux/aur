# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=rakarrack-git
pkgver=a620840
pkgrel=2
pkgdesc="Stereo digital effects processor with Jack support"
arch=('i686' 'x86_64')
url="http://rakarrack.sourceforge.net"
license=('GPL3')
depends=('alsa-utils' 'fftw' 'fltk' 'jack' 'libxpm')
makedepends=('git')
conflicts=('rakarrack')
provides=('rakarrack')
_gitname='rakarrack'
source=("${_gitname}::git+http://git.code.sf.net/p/rakarrack/git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

build(){
  cd ${_gitname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install
}
