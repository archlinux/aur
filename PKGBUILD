# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Julio Diez <juliosddr@gmail.com>

pkgname=suscan-git
pkgver=r461.cb0c650
pkgrel=1
pkgdesc="SUScan is a graphical signal analysis tool"
arch=("any")
url="https://github.com/BatchDrake/suscan"
license=("GPL")
depends=("soapysdr" "sigutils" "fftw" "libsndfile" "libxml2")
makedepends=("git" "autoconf" "automake" "libtool")
provides=("suscan")
conflicts=("suscan")
source=($pkgname::git+https://github.com/BatchDrake/suscan.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
