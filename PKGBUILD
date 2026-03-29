# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>

pkgname=leqm-nrt
_commit=d75d0af984d9c14bfefca8f1bdbc215c3bf3a388
pkgver=0.0.2.r13.gd75d0af
pkgrel=1
pkgdesc="An open source implementation of Leq(M) measurement with patches from Carl"
arch=('x86_64')
url="https://git.carlh.net/gitweb/?p=leqm-nrt.git;a=summary"
license=(GPL2)
makedepends=(git python)
source=(
  "leqm-nrt::git+https://git.carlh.net/git/leqm-nrt.git#commit=${_commit}"
)
sha256sums=('3309a21bcfcfc3df2be663d45310307e14a09221002b72ccb0685d2c9e07b288')

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
