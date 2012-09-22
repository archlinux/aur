# Maintainer: Florian Pritz <flo@xssn.at>
# $Id: PKGBUILD 71572 2012-05-29 20:53:33Z bluewind $
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

_pkgbasename=libssh2
pkgname=libx32-$_pkgbasename
pkgver=1.4.2
pkgrel=1.1
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (x32 ABI)"
url="http://www.libssh2.org/"
arch=('x86_64')
license=('BSD')
depends=('libx32-openssl' $_pkgbasename)
provides=('libssh2.so')
makedepends=('libx32-zlib' "gcc-multilib-x32")
options=('!libtool')
source=("http://www.libssh2.org/download/${_pkgbasename}-${pkgver}.tar.gz")
md5sums=('42e2b3796ac07fc1dbafc7abcc002cd3')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
