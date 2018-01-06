# $Id: PKGBUILD 277856 2018-01-03 07:03:59Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=obexftp
pkgver=0.24
pkgrel=12
pkgdesc="A tool for transfer files to/from any OBEX enabled device"
arch=('x86_64')
url="http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
license=('GPL')
depends=('openobex')
makedepends=('cmake' 'asciidoc' 'xmlto' 'fuse2' 'swig' 'ruby' 'tk')
optdepends=('ruby: ruby bindings'
            'tk: TCL/Tk bindings')
options=('!makeflags' '!docs')
source=("http://downloads.sourceforge.net/openobex/${pkgname}-${pkgver}-Source.tar.gz")
md5sums=('31a50dbbd09c63cbb5399772aaff7936')

build() {
  cd "${srcdir}/"

  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver}-Source \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DENABLE_PERL=YES \
    -DENABLE_PYTHON=YES \
    -DENABLE_RUBY=YES \
    -DENABLE_TCL=YES
  make doc
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
