# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>

pkgname=leqm-nrt
_commit=3913040723f746c0b4a59cb55cd8a23030ea49a2
pkgver=0.0.2.r14.g3913040
pkgrel=1
pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
arch=('x86_64')
url="https://git.carlh.net/gitweb/?p=leqm-nrt.git;a=summary"
license=(GPL2)
makedepends=(git python)
source=(
  "leqm-nrt::git+https://git.carlh.net/git/leqm-nrt.git#commit=${_commit}"
)
sha256sums=('7d2a520a1a501a8635cdfce2c33d3ae409208b36ab4efa883b0b68474669945c')

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
