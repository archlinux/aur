# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=htslib-git
pkgver=1.10.2.r134.ge9447f86
pkgrel=1
pkgdesc="C library for high-throughput sequencing data formats"
arch=('i686' 'x86_64')
url="https://github.com/samtools/htslib"
license=('custom')
depends=('glibc' 'bzip2' 'curl')
makedepends=('git')
provides=('htslib')
conflicts=('htslib')
options=('staticlibs')
source=("git+https://github.com/samtools/htslib.git")
sha256sums=('SKIP')


pkgver() {
  cd "htslib"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "htslib"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --enable-plugins \
    --with-plugin-dir="/usr/lib/htslib/plugins"
  make
}

check() {
  cd "htslib"

  #make check
}

package() {
  cd "htslib"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/htslib"
}
