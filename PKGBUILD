# Maintainer: Russi <ixaxaar@mailbox.org> <aur@ixaxaar.in>

pkgname=perftest
pkgver=24.10.0.0.66
pkgrel=1
pkgdesc="OpenFabrics Alliance InfiniBand verbs performance testing and benchmarking tools"
arch=('x86_64')
url="https://github.com/linux-rdma/perftest"
license=('GPL2' 'custom:OpenIB.org BSD')
depends=('bash' 'rdma-core')
makedepends=('git' 'autoconf' 'automake' 'libtool')
source=("git+https://github.com/linux-rdma/perftest.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  git checkout $(git describe --tags --abbrev=0)
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
