# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-desktop-git
_pkgname=linphone-desktop
pkgver=4.1.1.r288.g352e4985
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('i686' 'x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('bcg729-git' 'belcard-git' 'belle-sip-git' 'belr-git' 'bzrtp-git'
    'linphone-git' 'libpulse' 'libxv' 'mediastreamer-git' 'minizip-git'
    'ortp-git' 'libsoup' 'libnotify' 'qt5-svg'
    'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-tools')
makedepends=('cmake' 'graphviz' 'intltool' 'pkg-config' 'python-pystache' 'perl-xml-parser')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=('linphone-desktop')
conflicts=('linphone-desktop')
source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git"
    "find_minizip.patch")
sha256sums=('SKIP'
            'fe74b28500f73e81886f052f41e8946bac170249760f5fe694e96c4d75e0ed73')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

prepare() {
    cd $srcdir
    patch -p0 < ../find_minizip.patch
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
