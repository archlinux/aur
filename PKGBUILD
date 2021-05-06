# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=psximager-git
pkgver=2.0.r17.9c32ba2
pkgrel=1
pkgdesc='Tools for dumping and mastering PlayStation 1 ("PSX") CD-ROM images'
url="https://github.com/cebix/psximager"
arch=('x86_64')
license=('GPL')
depends=('boost' 'libcdio' 'vcdimager')
makedepends=('git')
source=("git+https://github.com/cebix/${pkgname%-git}.git")
sha256sums=('SKIP')
conflicts=('psximager')

pkgver() {
    cd "$srcdir"/${pkgname%-git}
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags | sed -e 's/v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/${pkgname%-git}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
