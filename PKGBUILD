# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project
pkgver=20230929
pkgrel=2
pkgdesc="Collection of tools for testing the Linux kernel and related features"
arch=(i686 x86_64)
license=(GPL2)
url="https://linux-test-project.github.io/"
depends=(acl bash gawk libcap perl python numactl keyutils openssl glibc)
options=(!lto !strip)
source=("https://github.com/linux-test-project/ltp/releases/download/${pkgver}/ltp-full-${pkgver}.tar.xz")
sha256sums=('eb161ff8f1966a1f3428fd4561eb20ebb9f83b7519e35cc12fc66bcfa7983b6b')

build() {
  cd "${srcdir}/ltp-full-${pkgver}"
  ./configure \
    --prefix=/usr/share \
    --mandir=/usr/share/man \
    --with-bash

  make
}

check() {
  cd "${srcdir}/ltp-full-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/ltp-full-${pkgver}"
  make DESTDIR="$pkgdir" install
}

