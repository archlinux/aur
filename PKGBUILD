# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-desktop-git
_pkgname=linphone-desktop
pkgver=4.1.1.r371.g3afd20ef
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('bcg729-git' 'belcard-git' 'belle-sip-git' 'belr-git' 'bzrtp-git'
    'linphone-git' 'libpulse' 'libxv' 'mediastreamer-git' 'minizip-git'
    'ortp-git' 'libsoup' 'libnotify' 'qt5-svg' 'qt5-quickcontrols'
    'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-tools')
makedepends=('cmake' 'graphviz' 'intltool' 'pkg-config' 'python-pystache' 'perl-xml-parser')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=('linphone-desktop')
conflicts=('linphone-desktop')
source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

build() {
  cd $_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
