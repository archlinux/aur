pkgname=seamulator-git
pkgver=r23.8f1fd27
pkgrel=1
pkgdesc="Seamulator is an ocean wave simulator."
arch=('i686' 'x86_64')
url="http://git.treefish.org/~alex/seamulator.git"
license=('GPL3')
source=('seamulator-git::git+https://git.treefish.org/~alex/seamulator.git')
depends=('fftw>=3.3.4' 'freeglut>=3.0.0' 'libgl' 'boost-libs>=1.60.0')
makedepends=('git' 'boost>=1.60.0')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$pkgname
  cmake .
  make
}

package() {
  install -Dm755 -t ${pkgdir}/usr/bin $srcdir/$pkgname/src/seamulator
}
