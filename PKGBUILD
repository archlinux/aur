# Maintainer: Anatol Pomozov
# Contributor: KokaKiwi <admin@kokaelkiwi.eu>

pkgname=nanomsg-git
pkgver=0.5.beta.r82.ga6dcc0c
pkgrel=1
pkgdesc='Simple high-performance implementation of several "scalability protocols"'
url='http://nanomsg.org/'
license=(MIT)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
provides=(nanomsg)
source=(git://github.com/nanomsg/nanomsg)
sha256sums=('SKIP')

pkgver() {
  cd nanomsg
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd nanomsg
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd nanomsg
  make check
}

package() {
  cd nanomsg
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
