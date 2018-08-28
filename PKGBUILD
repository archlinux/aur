# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=libwacom
pkgname="lib32-$_basename"
pkgver=0.31
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (32-bit)"
arch=('x86_64')
url="https://github.com/linuxwacom/libwacom/wiki"
license=('MIT')
depends=('lib32-glib2' 'lib32-systemd' 'lib32-libgudev' "$_basename")
makedepends=('lib32-libxml2')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
source=(https://github.com/linuxwacom/libwacom/releases/download/${_basename}-${pkgver}/${_basename}-${pkgver}.tar.bz2{,.sig})
sha1sums=('09ee6ae1d4e8b55756a8ffaf9136df03c521ae44'
          'SKIP')
sha256sums=('18d58c254bee88527f5d58f6fd18458a9f0097641a1ee116dc2b6950619fbf03'
            'SKIP')

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd $_basename-$pkgver
  make check
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf ${pkgdir}/usr/{bin,share,include}  
}
