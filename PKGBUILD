# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=cxxtools
_commit=22c20418fa580ed0023b945dc5fe1c9212e0fbc8
pkgver=5.0
pkgrel=1
pkgdesc="Collection of general-purpose C++ classes"
url="https://github.com/maekitalo/cxxtools"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL-2.1-or-later')
depends=('bash' 'gcc-libs' 'libnsl' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maekitalo/cxxtools/archive/${_commit}.tar.gz")
sha256sums=('b28e721c19a2da76d9825c238322c0a37deecea334777e44dbf47ce473a150ad')

build() {
  cd "${srcdir}/${pkgname}-${_commit}"

  autoreconf -fi
  ./configure --prefix=/usr \
              --disable-static \
              --disable-demos \
              --disable-unittest
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  make DESTDIR="${pkgdir}" install
}
