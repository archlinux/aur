# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Julio Diez <juliosddr@gmail.com>

pkgname=sigutils-git
pkgver=r186.4a1e057
pkgrel=1
pkgdesc="Digital signal processing library"
arch=("any")
url="https://github.com/BatchDrake/sigutils"
license=("GPL")
depends=("libsndfile" "alsa-lib")
makedepends=("git" "autoconf" "automake")
provides=("sigutils")
conflicts=("sigutils")
source=(${pkgname}::git+https://github.com/BatchDrake/sigutils.git)
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  
  autoreconf -fvi
  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
