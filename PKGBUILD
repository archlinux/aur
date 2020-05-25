# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=fsverity-utils-git
pkgver=1.0.r10.ge597966
pkgrel=1
pkgdesc='A userspace utility for fs-verity'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git'
license=('GPL')
makedepends=('git')
depends=('openssl')
conflicts=('fsverity-utils')
provides=('fsverity-utils')
source=('git+https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git')
sha256sums=('SKIP')

pkgver() {
  cd fsverity-utils
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd fsverity-utils
  make
}

check() {
  cd fsverity-utils
  make check
}

package() {
  cd fsverity-utils
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/fsverity-utils/README.md"
}
