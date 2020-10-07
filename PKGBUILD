# Maintainer: Thulinma <jaron@vietors.com>
pkgname=mistserver-git
pkgdesc="The MistServer media server toolkit, open source edition, unstable development branch"
pkgver=2.18
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags
}
pkgrel=1
license=('AGPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://mistserver.org"
makedepends=('cmake' 'git')
source=("mistserver-git::git+http://github.com/DDVTECH/mistserver.git#branch=development")
md5sums=('SKIP')
build() {
  cd "$srcdir/$pkgname"
  mkdir -p generated
  cmake . -DDEBUG=3 -DRELEASE="Generic_$CARCH" -DBUILD_SHARED_LIBS=true -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  install mistserver.service "$pkgdir/usr/lib/systemd/system/"
}

