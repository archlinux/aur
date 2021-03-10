# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project-git
pkgver=20210121.r115.g47e1af27f
pkgrel=1
pkgdesc="Collection of tools for testing the Linux kernel and related features"
arch=(i686 x86_64)
license=(GPL2)
url="https://linux-test-project.github.io/"
depends=(acl bash gawk libcap libtirpc numactl)
makedepends=(git)
source=("git+https://github.com/linux-test-project/ltp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ltp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/ltp"
  make autotools
  ./configure --prefix=/usr/share --mandir=/usr/share/man --with-bash 
  make
}

package() {
  cd "${srcdir}/ltp"
  make DESTDIR="$pkgdir" install
}

