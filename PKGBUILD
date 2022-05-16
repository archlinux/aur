# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>

pkgname=leqm-nrt
pkgver=0.0.2.r9.ga3c16b5
pkgrel=1
pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
arch=('x86_64')
url="https://git.carlh.net/gitweb/?p=leqm-nrt.git;a=summary"
license=(GPL2)
makedepends=(git python)
source=(
  "leqm-nrt::git+git://git.carlh.net/git/leqm-nrt.git#branch=carl"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  ./waf configure --without-libsndfile --prefix=/usr
}

build() {
  cd "$pkgname"
  ./waf build
}

package() {
  pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
  cd leqm-nrt
  DESTDIR="${pkgdir}" ./waf install
} 
