# Contributor: <michal.bozon@gmail.com>

pkgname=opensc-openct
_pkgname=OpenSC
pkgver=0.20.0
pkgrel=1
pkgdesc='OpenSC compiled with OpenCT instead of PCSC, working with e.g. SafeNet/Aladdin eToken Pro 64k'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
depends=('openssl' 'openct')
source=("https://github.com/OpenSC/OpenSC/archive/$pkgver.tar.gz")
sha256sums=('c8ddea5eb767f08e9e70bc6506d72f8e73805803b974bd3a96dce6c3af3bfe95')


_prefix=/opt/$pkgname

build() {
  cd $_pkgname-$pkgver
  ./bootstrap
  ./configure \
    --prefix=$_prefix \
    --disable-pcsc \
    --enable-openct \
    --with-completiondir=$_prefix/share/bash-completion/completions
  make

  mkdir -p ./$_prefix
}

package(){
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
