# Maintainer Mr.E

pkgname=rr-debugger
pkgver=5.6.0
pkgrel=1
pkgdesc="rr is a lightweight tool for recording, replaying and debugging execution of applications"
arch=('x86_64')
url="https://github.com/rr-debugger/rr"
provides=('rr')
depends=('cmake' 'capnproto' 'python-pexpect')
source=("https://github.com/rr-debugger/rr/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a75262ae622c2c91d3391401d3da4e1dc9379b5afea5c40c9ea93f6905706c87')

prepare() {
  rm -fR rr-${pkgver}/obj
  sed -i '1s;^;#include <time.h>\n;' rr-${pkgver}/src/test-monitor/test-monitor.cc
}

build() {
  cd rr-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release -S . -B obj
  cmake --build obj -j
}

package() {
  cd "rr-${pkgver}/obj"
  make install PREFIX="/usr" DESTDIR="${pkgdir}"
}

