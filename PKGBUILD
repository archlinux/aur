# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Julio Diez <juliosddr@gmail.com>

pkgname=sigutils-git
pkgver=r203.8caefe4
pkgrel=1
pkgdesc="Digital signal processing library"
arch=("any")
url="https://github.com/BatchDrake/sigutils"
license=("GPL")
depends=("libsndfile" "alsa-lib" "fftw")
makedepends=("git" "cmake>=3.7.2")
optdepends=("libvolk")
provides=("sigutils")
conflicts=("sigutils")
source=(${pkgname}::git+https://github.com/BatchDrake/sigutils.git)
md5sums=('SKIP')
options=('!buildflags')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname/build"

  make DESTDIR="$pkgdir/" install
}
