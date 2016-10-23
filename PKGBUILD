# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24
pkgver='1.1.7.r8.gc94f877'
pkgver() {
  cd RF24
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='Python bindings for RF24 radio modules'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://tmrh20.github.io/RF24/'
license=('MIT')
depends=('python' 'python-spidev' 'rf24')
makedepends=('boost')
source=('git://github.com/TMRh20/RF24')
md5sums=('SKIP')

build() {
  cd "$srcdir/RF24"
  ./configure --driver=SPIDEV --prefix="/usr" --ldconfig=''
  cd "$srcdir/RF24/pyRF24"
  python setup.py build
}

package() {
  cd "$srcdir/RF24/pyRF24"
  python setup.py install --root="$pkgdir/" --optimize=1
}

