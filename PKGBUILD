# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=liblinphone-git
_pkgname=linphone
pkgver=5.1.0.alpha.r55.g59940f045
pkgrel=1
pkgdesc="A Voice-over-IP phone library and CLI"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('belcard>=5.0' 'belle-sip>=5.0' 'bzrtp>=5.0' 'ffmpeg' 'lime>=5.0'
    'mediastreamer>=5.1' 'ortp>=5.1' 'xerces-c')
makedepends=('cmake' 'doxygen' 'git' 'graphviz' 'python-pystache' 'xsd')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=("liblinphone=$pkgver")
conflicts=('liblinphone')
install=linphone.install
source=("git+https://github.com/BelledonneCommunications/linphone.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cmake -B build $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=NO \
    -DENABLE_CXX_WRAPPER=YES \
    -DENABLE_DOC=NO \
    -DENABLE_LIME=NO \
    -DENABLE_LIME_X3DH=YES \
    -DENABLE_UNIT_TESTS=NO \
    -DENABLE_STRICT=NO \
    -DENABLE_FLEXIAPI=NO \
    -DCMAKE_INSTALL_RPATH=NO \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="$pkgdir" -C build install
}
