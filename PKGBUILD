# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=fsverity-utils-git
pkgver=1.2.r11.gb561e4a
pkgrel=1
pkgdesc='Userspace utilities for fs-verity'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git'
license=('MIT')
makedepends=('git')
depends=('openssl')
conflicts=('fsverity-utils')
provides=('fsverity-utils')
source=('git+https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git')
sha256sums=('SKIP')

export USE_SHARED_LIB=1

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
  install -Dm644 NEWS.md "${pkgdir}/usr/share/doc/fsverity-utils/NEWS.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/fsverity-utils/LICENSE"
}
