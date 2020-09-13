# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=haveged-git
pkgver=1.9.8.r0.g8cd0266
pkgrel=1
pkgdesc="A simple entropy daemon"
arch=('i686' 'x86_64')
url="https://www.issihosts.com/haveged/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('haveged')
conflicts=('haveged')
options=('staticlibs')
source=("git+https://github.com/jirka-h/haveged.git")
sha256sums=('SKIP')


pkgver() {
  cd "haveged"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "haveged"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "haveged"

  make check
}

package() {
  cd "haveged"

  make DESTDIR="$pkgdir" install

  install -Dm644 "init.d/service.fedora" "$pkgdir/usr/lib/systemd/system/haveged.service"
}
