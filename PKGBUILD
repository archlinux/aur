# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>
# Adapted from: Dan McGee <dan@archlinux.org>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.10.2
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
sha256sums=('3c663919dc5c66ec991da14c7cf7e0be8ad00f3db73986a987c118862b5f6071')
sha512sums=('0ae29be77794df0ba254967649b9728611a75fbb3acd32ab6634d76399d1ce97c7d12d31da465482a7e4f3207093415c496c39525cace9b78ab3cb9444dd7640')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC="musl-gcc -static"
  export CFLAGS='-Os -static'
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix=""  \
    --with-libedit

  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # license
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
 
