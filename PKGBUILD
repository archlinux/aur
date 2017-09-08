# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-desktop-git
_pkgname=linphone-desktop
pkgver=4.1.1.r137.gc7db0134
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('i686' 'x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('linphone-git' 
	 'libpulse' 'libxv' 'mediastreamer-git' 'ortp-git' 'bzrtp-git'
     'bcg729' 'libsoup' 'belle-sip-git' 'libnotify' 'qt5-quickcontrols'
     'qt5-quickcontrols2' 'qt5-graphicaleffects')
makedepends=('cmake' 'pkg-config' 'python-pystache' 'perl-xml-parser' 'intltool')
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
