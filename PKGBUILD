# Maintainer: dylif <aur_kl40w9du AT dylif DOT org>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtiff-maya-git
pkgver=4.3.0.r209.gb92d4ad0
pkgrel=1
pkgdesc="TIFF library and utilities (built with --enable-ld-version-script flag for maya support)"
arch=('i686' 'x86_64')
url="https://libtiff.gitlab.io/libtiff/"
license=('custom')
depends=('glibc' 'libjpeg' 'xz' 'zlib')
makedepends=('git' 'freeglut' 'glu' 'jbigkit' 'mesa')
optdepends=('freeglut: for using tiffgt')
provides=('libtiff' 'libtiff.so' 'libtiffxx.so')
conflicts=('libtiff')
replaces=('libtiff')
options=('staticlibs')
source=("git+https://gitlab.com/libtiff/libtiff.git")
sha256sums=('SKIP')


pkgver() {
  cd "libtiff"

  git describe --long --tags | sed 's/^Release-v//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libtiff"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --with-docdir="/usr/share/doc/libtiff" \
    --enable-ld-version-script
  make
}

check() {
  cd "libtiff"

  make check
}

package() {
  cd "libtiff"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/libtiff"
}
