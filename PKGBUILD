# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>
# Adapted from: Dan McGee <dan@archlinux.org>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.9.1
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible, statically linked to musl libc"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl') #we are static
install=dash.install
source=("http://gondor.apana.org.au/~herbert/dash/files/${_pkgbase}-${pkgver}.tar.gz")
sha1sums=('7b9cb47fc2a007c26fedc99d22a7fc1dc2f5f914')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC="musl-gcc -static"
  export CFLAGS='-Os -static'
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" 

  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # license
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
 
