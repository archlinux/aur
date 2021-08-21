# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fig2dev-git
pkgver=3.2.8a.r20.g17cdd85
pkgrel=1
pkgdesc="Format conversion utility that can be used with xfig"
arch=('i686' 'x86_64')
url="http://mcj.sourceforge.net/"
license=('custom')
depends=('glibc' 'ghostscript' 'libpng' 'netpbm' 'zlib')
makedepends=('git')
provides=('fig2dev' 'transfig')
conflicts=('fig2dev' 'transfig')
replaces=('transfig')
source=("git+https://git.code.sf.net/p/mcj/fig2dev")
sha256sums=('SKIP')


pkgver() {
  cd "fig2dev"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "fig2dev"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --enable-transfig
  make
}

check() {
  cd "fig2dev"

  make check
}

package() {
  cd "fig2dev"

  make DESTDIR="$pkgdir" install
}
