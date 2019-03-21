# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dosfstools-git
pkgver=4.1.r86.gfc55b63
pkgrel=1
pkgdesc="DOS filesystem utilities"
arch=('i686' 'x86_64')
url="https://github.com/dosfstools/dosfstools"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('dosfstools')
conflicts=('dosfstools')
source=("git+https://github.com/dosfstools/dosfstools.git")
sha256sums=('SKIP')


pkgver() {
  cd "dosfstools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dosfstools"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --enable-compat-symlinks
  make
}

check() {
  cd "dosfstools"

  #make check
}

package() {
  cd "dosfstools"

  make DESTDIR="$pkgdir" install
}
