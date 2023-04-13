# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vmtouch-git
pkgver=1.3.1.r17.g8f6898e
pkgrel=1
pkgdesc="Portable file system cache diagnostics and control"
arch=('i686' 'x86_64')
url="https://hoytech.com/vmtouch/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'perl')
provides=("vmtouch=$pkgver")
conflicts=('vmtouch')
source=("git+https://github.com/hoytech/vmtouch.git")
sha256sums=('SKIP')


pkgver() {
  cd "vmtouch"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "vmtouch"

  make
}

package() {
  cd "vmtouch"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/vmtouch"
}
