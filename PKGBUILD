#Contributor:Andrea Tarocchi <valdar@email.it> 
pkgname=wiiuse
pkgver=0.14.0
pkgrel=5
pkgdesc="Library written in C that connects with several Nintendo Wii remotes" 
arch=(i686 x86_64)
url="https://github.com/rpavlik/wiiuse" 
depends=('bluez-libs' 'cmake')
license="GPL3"
install=wiiuse.install
postfix=_src.tar.gz
#source=("$pkgname-$pkgver.tar.gz::https://github.com/rpavlik/$pkgname/zipball/$pkgver")
source=("git+https://github.com/rpavlik/wiiuse.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  [[ ! -e build ]] && mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m644 ./build/src/libwiiuse.so "$pkgdir/usr/lib/libwiiuse.so"
  install -D -m644 ./src/wiiuse.h "$pkgdir/usr/include/wiiuse.h"
}