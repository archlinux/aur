# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Christopher Jeffrey
# URL: https://github.com/handshake-org/hnsd
# Upstream: https://github.com/handshake-org/hnsd

pkgname=hnsd-git
pkgver=0.0.0.895d89c
pkgrel=1
pkgdesc='SPV resolver daemon for the Handshake network. Written in C for speed/size/embedability.'
arch=('i686' 'x86_64')
url='http://handshake.org/'
license=('MIT')
depends=('libuv' 'unbound')
makedepends=('git' 'gcc' 'make')
provides=('hnsd')
conflicts=('hnsd')
source=("$pkgname::git+https://github.com/handshake-org/hnsd.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  #git describe | sed 's/^v//;s/-/./g'
  echo 0.0.0.g$(git rev-parse --short HEAD)
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$pkgname"
  install -D -m644 hnsd "$pkgdir/usr/bin/hnsd"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
