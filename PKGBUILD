# Maintainer: Michael Taboada <michael@2mb.solutions>
#contributer: Storm Dragon <stormdragon2976@gmail.com>
_pkgbase=opusfile
pkgname=lib32-$_pkgbase
pkgver=0.10
pkgrel=1
pkgdesc='Library for opening, seeking, and decoding .opus files - 32 bit version'
arch=('x86_64')
url='http://www.opus-codec.org/'
license=('BSD')
depends=('lib32-libogg' 'lib32-openssl' 'lib32-opus' 'opusfile' 'lib32-glibc')
makedepends=('gcc' 'lib32-gcc-libs')
source=("http://downloads.xiph.org/releases/opus/$_pkgbase-$pkgver.tar.gz")
sha256sums=('48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd "$_pkgbase-$pkgver"

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$_pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share}
  install -d "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
