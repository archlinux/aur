# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

_pkgname=vde2
pkgname="${_pkgname}-git"
pkgver=v2.3.3.r60.7e7017b
pkgrel=1

pkgdesc="VDEv2: Virtual Distributed Ethernet."
arch=('x86_64')
url='https://github.com/virtualsquare/vde-2'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('glibc' 'vdeplug4' 'libpcap' 'wolfssl')
makedepends=('git' 'cmake')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C vde-2 describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/vde-2/"
  cmake -S . -B build/ \
    -D'CMAKE_INSTALL_PREFIX=/usr' \
    -D'CMAKE_INSTALL_LIBEXECDIR=lib'
}

build() {
  cd "${srcdir}/vde-2/build/"
  make
}

package() {
  cd "${srcdir}/vde-2/"
  install -Dm 644 COPYING -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 644 COPYING.libvdeplug -T "${pkgdir}/usr/share/licenses/libvdeplug/LICENSE"

  cd "build/"
  make DESTDIR="${pkgdir}" install
}

