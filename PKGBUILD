# Contributor: <michal.bozon@gmail.com>

pkgname=opensc-openct
_pkgname=OpenSC
pkgver=0.17.0
pkgrel=1
pkgdesc='OpenSC compiled with OpenCT instead of PCSC, working with e.g. SafeNet/Aladdin eToken Pro 64k'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
depends=('openssl' 'openct')
source=("https://github.com/OpenSC/OpenSC/archive/$pkgver.tar.gz")
sha256sums=('007c4622afc225b8d7a1bea54f5325affa4417f4e17aaa03256aa9f4c25782fd')


_prefix=/opt/$pkgname

build() {
  cd $_pkgname-$pkgver
  ./bootstrap
  ./configure \
    --prefix=$_prefix \
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
