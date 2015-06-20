# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: peter feigl <peter.feigl@gmail.com>

pkgname=mit-scheme
pkgver=9.2
pkgrel=1
pkgdesc='MIT/GNU Scheme'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.gnu.org/software/mit-scheme/'
depends=('glibc' 'ncurses' 'zlib')
optdepends=('openssl: support for openssl')

if [[ $CARCH == i686 ]]; then
  _arch=i386
  md5sums=('b80458f85b9521bdfb0620edc89e3e61')
else
  _arch=x86-64
  md5sums=('9fcc6c156e53efeb0560996551fa0a57')
fi
source=(http://ftp.gnu.org/gnu/$pkgname/stable.pkg/$pkgver/$pkgname-$pkgver-$_arch.tar.gz)

build() {
  cd $pkgname-$pkgver/src
  ./configure --prefix=/usr \
    --with-x \
    --enable-native-code
  make
}

package() {
  cd $pkgname-$pkgver/src
  make DESTDIR="$pkgdir" install
}
