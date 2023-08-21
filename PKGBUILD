# Maintainer: Dringsim <dringsim@qq.com>
pkgname=php-zmq-git
pkgver=1.1.2.r105.g84f0720
pkgrel=2
pkgdesc="ZeroMQ is a software library that lets you quickly design and implement a fast message-based applications. (Git version)"
url="https://github.com/mkoppanen/php-zmq"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'zeromq')
makedepends=('gcc' 'git')
provides=("php-zmq")
conflicts=("php-zmq")
backup=('etc/php/conf.d/zmq.ini')
source=("git+https://github.com/zeromq/php-zmq.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/php-zmq"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/php-zmq"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/php-zmq"

  make INSTALL_ROOT="$pkgdir" install

  echo 'extension=zmq.so' > zmq.ini 
  install -Dm644 zmq.ini "$pkgdir/etc/php/conf.d/zmq.ini"
}
