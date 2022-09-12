# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>

pkgname=leqm-nrt-git
pkgver=0.0.2.r10.gb795210
_branch=carl
pkgrel=1
pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
arch=('x86_64')
url="https://git.carlh.net/gitweb/?p=leqm-nrt.git;a=summary"
license=(GPL2)
makedepends=(git python)
source=(
  "$pkgname::git+git://git.carlh.net/git/leqm-nrt.git#branch=${_branch}"
)
sha256sums=('SKIP')
conflicts=('leqm-nrt')
provides=('leqm-nrt')

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
  cd $pkgname
  DESTDIR="${pkgdir}" ./waf install
} 
