# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtiff-minimal-git
pkgver=4.2.0.r7.gec8bdded
pkgrel=1
pkgdesc="TIFF library and utilities"
arch=('i686' 'x86_64')
url="https://libtiff.gitlab.io/libtiff/"
license=('custom')
depends=('glibc' 'libjpeg' 'xz' 'zlib')
makedepends=('git' 'mesa' 'wget')
optdepends=('freeglut: for using tiffgt'
	    'glu: glu support'
            'jbigkit: jbigkit support')
provides=('libtiff')
conflicts=('libtiff')
options=('staticlibs')
source=("git+https://gitlab.com/libtiff/libtiff.git")
sha256sums=('SKIP')


pkgver() {
  cd "libtiff"

  git describe --long --tags | sed 's/^Release-v//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libtiff"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

#check() {
#  cd "libtiff"

#  make check
#}

package() {
  cd "libtiff"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/libtiff"
}
