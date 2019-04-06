# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libgpg-error-git
pkgver=1.36.r2.g86cb22a
pkgrel=1
pkgdesc="Error codes library used by GnuPG et al."
arch=('i686' 'x86_64')
url="https://www.gnupg.org/software/libgpg-error/index.html"
license=('LGPL')
depends=('glibc' 'sh')
makedepends=('git')
provides=('libgpg-error')
conflicts=('libgpg-error')
source=("git+https://dev.gnupg.org/source/libgpg-error.git")
sha256sums=('SKIP')


pkgver() {
  cd "libgpg-error"

  git describe --long --tags | sed 's/^gpgrt-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libgpg-error"

  ./autogen.sh
  ./configure \
    --enable-maintainer-mode \
    --prefix="/usr"
  make
}

check() {
  cd "libgpg-error"

  make check
}

package() {
  cd "libgpg-error"

  make DESTDIR="$pkgdir" install
}
