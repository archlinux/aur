# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=libscrypt-git
pkgver=1.21.r13.ga402f41
pkgrel=1
pkgdesc="Linux scrypt shared library"
arch=('i686' 'x86_64')
url="https://github.com/technion/libscrypt"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('libscrypt')
conflicts=('libscrypt')
source=("git+https://github.com/technion/libscrypt.git")
sha256sums=('SKIP')


pkgver() {
  cd "libscrypt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libscrypt"

  make
}

check() {
  cd "libscrypt"

  make check
}

package() {
  cd "libscrypt"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libscrypt/LICENSE"
}
