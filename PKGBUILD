# Maintainer: VirtualTam <<virtualtam@flibidi.net>>
pkgname=iannix-qt5-git
pkgver=0.9.17.r29.g46714c2
pkgrel=1
pkgdesc="A graphical sequencer, based on Iannis Xenakis' works, for digital art (Qt5)."
arch=('i686' 'x86_64')
url="http://www.iannix.org/"
license=('GPL3')
depends=('alsa-lib' 'gdk-pixbuf2' 'glu' 'qt5-script' 'qt5-tools')
makedepends=('gcc' 'git')
optdepends=('ffmpeg: record and convert audio streams'
            'libfreenect: XBox Kinect'
            'libwacom: Wacom tablets and trackpads')
provides=('iannix')
conflicts=('iannix' 'iannix-git')
_gitname=iannix
source=("${_gitname}::git+http://github.com/iannix/IanniX.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  PREFIX="/usr" qmake-qt5
  make
}

package() {
  cd ${_gitname}
  make INSTALL_ROOT="${pkgdir}" install
}
