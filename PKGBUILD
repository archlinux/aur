# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project-git
pkgver=20220930.r75.g8cd3bf314
pkgrel=1
pkgdesc="Collection of tools for testing the Linux kernel and related features"
arch=(i686 x86_64)
license=(GPL2)
url="https://linux-test-project.github.io/"
depends=(acl bash gawk libcap perl numactl libaio libmnl python)
makedepends=(git)
source=("git+https://github.com/linux-test-project/ltp.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "${srcdir}/ltp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/ltp"
  make autotools
}

build() {
  cd "${srcdir}/ltp"
  ./configure \
    --prefix=/usr/share \
    --mandir=/usr/share/man \
    --with-bash

  make
}

package() {
  cd "${srcdir}/ltp"
  make DESTDIR="$pkgdir" install
}

