# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>

pkgname=leqm-nrt
_commit=4560105773c66ac9216b62313a24093bb0a027ae
pkgver=0.0.2.r11.g4560105
pkgrel=1
pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
arch=('x86_64')
url="https://git.carlh.net/gitweb/?p=leqm-nrt.git;a=summary"
license=(GPL2)
makedepends=(git python)
source=(
  "leqm-nrt::git+git://git.carlh.net/git/leqm-nrt.git#commit=${_commit}"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./waf configure --without-libsndfile --prefix=/usr
  ./waf build
}

package() {
  pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
  cd leqm-nrt
  DESTDIR="${pkgdir}" ./waf install
} 
