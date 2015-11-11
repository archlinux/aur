# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=stderred-git
_gitname=stderred
pkgver=v1.0.r23.gdfe65c8
pkgrel=2
pkgdesc="LD_PRELOAD hack to color stderr output red"
arch=(i686 x86_64)
url="https://github.com/sickill/stderred"
license=(MIT)
depends=(glibc)
makedepends=(git cmake)
provides=(stderred)
conflicts=(stderred)
source=(git+https://github.com/sickill/stderred)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  [ -d build ] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

package() {
  cd "$_gitname"/build
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/$_gitname"/README.md "$pkgdir"/usr/share/doc/stderred/README.md
  install -D "$srcdir/$_gitname"/LICENSE "$pkgdir"/usr/share/licenses/stderred-git/LICENSE
}
