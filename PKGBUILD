# Maintainer: Michael Taboada <michael@2mb.solutions>
#contributer: Storm Dragon <stormdragon2976@gmail.com>
_pkgbase=opusfile
pkgname=lib32-$_pkgbase
pkgver=0.8
pkgrel=1
pkgdesc='Library for opening, seeking, and decoding .opus files - 32 bit version'
arch=('x86_64')
url='http://www.opus-codec.org/'
license=('BSD')
depends=('lib32-libogg' 'lib32-openssl' 'lib32-opus' 'opusfile' 'lib32-glibc')
makedepends=('gcc-multilib')
source=("http://downloads.xiph.org/releases/opus/$_pkgbase-$pkgver.tar.gz")
sha256sums=('2c231ed3cfaa1b3173f52d740e5bbd77d51b9dfecb87014b404917fba4b855a4')

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
