# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
_commit=6f26ca2ef205424252bd1313a112ca3f54a08606
pkgver=2.0
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://roy.marples.name/projects/parpd"
license=(BSD)
makedepends=(git)
source=("git+https://github.com/NetworkConfiguration/parpd#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe | sed "s/^parpd-//; s/-/.r/; s/-/./"
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr       \
    --sbindir=/usr/bin  \
    --rundir=/run       \
    ;
  # Missing in 2.0.0
  echo '#define __arraycount(a) (sizeof(a) / sizeof(a[0]))' >> config.h
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
