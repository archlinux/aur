# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=vdecapture-git
_pkgname=vdecapture
pkgver=r4.6cc3a88
pkgrel=1

pkgdesc="vdecapture captures packet data from a live VDE network and saves it to an output file in pcap format."
arch=('x86_64')
url='https://github.com/virtualsquare/vdecapture'
license=('GPL-2.0-or-later')
makedepends=('cmake')
depends=('vdeplug4')
provides=('vdecapture')
conflicts=('vdecapture')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cmake -S . -B build/ \
    -D'CMAKE_INSTALL_PREFIX=/usr'
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 644 COPYING -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build/"
  make DESTDIR="$pkgdir" install
}

