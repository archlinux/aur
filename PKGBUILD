# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=liboggz-git
pkgver=1.1.1.r37.gacf142b
pkgrel=2
pkgdesc="Tools to inspect, edit and validate Ogg files"
arch=('i686' 'x86_64')
url="https://www.xiph.org/oggz/"
license=('BSD')
depends=('glibc' 'libogg' 'sh')
makedepends=('git')
provides=('liboggz')
conflicts=('liboggz')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/liboggz.git")
sha256sums=('SKIP')


pkgver() {
  cd "liboggz"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "liboggz"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "liboggz"

  make check
}

package() {
  cd "liboggz"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/liboggz"

  install -Dm644 "bash-completion/oggz" "$pkgdir/usr/share/bash-completion/completions/oggz"
}
