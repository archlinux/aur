# Maintainer: VirtualTam <virtualtam@flibidi.net
pkgname=xtrkcad
pkgver=4.2.0_beta1
pkgrel=2
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gtk2' 'webkitgtk2')
optdepends=()
makedepends=('cmake' 'mercurial' 'gettext')
conflicts=('xtrkcad')
provides=()
replaces=()
backup=()
source=(
    "http://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${pkgver//_/-}/xtrkcad-source-${pkgver//_/-}.tar.bz2")
md5sums=('48f00a37206a0a8c8e9fe794f7fc3e53')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS="-lm"  -DCMAKE_BUILD_TYPE="Release" -DXTRKCAD_USE_GETTEXT="ON"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/app/lib/icon.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}

