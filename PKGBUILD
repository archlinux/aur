#Contributor:Andrea Tarocchi <valdar@email.it> 
pkgname=wiiuse
pkgver=0.15.2
pkgrel=6
pkgdesc="Library written in C that connects with several Nintendo Wii remotes" 
arch=('x86_64')
url="https://github.com/wiiuse/wiiuse" 
depends=('bluez-libs') 
makedepends=('cmake' 'git')
license=('GPL3')
install=wiiuse.install
postfix=_src.tar.gz
#source=("$pkgname-$pkgver.tar.gz::https://github.com/wiiuse/$pkgname/zipball/$pkgver")
source=("git+https://github.com/wiiuse/wiiuse.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  [[ ! -e build ]] && mkdir build
  cd build
  ccmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLE_SDL=NO
  #[-DCMAKE_INSTALL_PREFIX=/usr/local] 
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m644 ./build/src/libwiiuse.so "$pkgdir/usr/lib/libwiiuse.so"
  install -D -m644 ./src/wiiuse.h "$pkgdir/usr/include/wiiuse.h"
}
