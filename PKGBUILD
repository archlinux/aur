# Contributor: <michal.bozon@gmail.com>

pkgname=opensc-openct
_pkgname=OpenSC
pkgver=0.15.0
pkgrel=1
pkgdesc='OpenSC compiled with OpenCT instead of PCSC, working with e.g. SafeNet/Aladdin eToken Pro 64k'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
depends=('openssl' 'openct')
source=("https://github.com/OpenSC/OpenSC/archive/0.15.0.tar.gz")
md5sums=('f266024e5a9630821ffa0ac14f72e369')
sha1sums=('4a6c21cf7d8da73c4f0a74206e87261f68aba41e')
sha256sums=('8f8f8cf52e0252334e4dfdccca829b876a3de6340deb772aa0bfe0c0cc10eaf5')

_prefix=/opt/$pkgname

build() {
  cd $_pkgname-$pkgver
  ./bootstrap
  ./configure \
    --prefix=/opt/opensc-openct \
    --disable-pcsc \
    --enable-openct
  make

  mkdir -p ./$_prefix
}

package(){
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
