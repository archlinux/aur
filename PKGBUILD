# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 (aka josephgbr)

_pkgbase=libsigc++
pkgbase=lib32-libsigc++
pkgname=${pkgbase}
pkgver=2.10.0
pkgrel=1
arch=('x86_64')
license=('LGPL')
url="http://libsigc.sourceforge.net/"
makedepends=('gcc-libs' 'git' 'mm-common' 'libxslt' 'graphviz')
options=('!emptydirs')
_commit=83f1e2fe7855f85af570b9653903d2c426d67e72
source=("git://git.gnome.org/libsigcplusplus#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libsigcplusplus
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libsigcplusplus
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libsigcplusplus
  ./configure --prefix=/usr --libdir=/usr/lib32 CXX='g++ -m32'
  make
}

package() {
  pkgdesc="Libsigc++ implements a full callback system for use in widget libraries - V2"
  depends=('gcc-libs')

  cd libsigcplusplus
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install

  # Removing files included in base libsigc++ package
  rm -rf ${pkgdir}/usr/include
}
