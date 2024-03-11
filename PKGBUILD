# Maintainter: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Julio Diez <juliosddr@gmail.com>

pkgname=sigutils-git
pkgver=r587.dd4bdcf
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
source=("${pkgname}::git+https://github.com/BatchDrake/sigutils.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"

    git submodule init
    git submodule update
}

build() {
  cd "${pkgname}"
  
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON -DCMAKE_SKIP_INSTALL_RPATH=ON ..
  make
}

package() {
  cd "$pkgname/build"

  make DESTDIR="$pkgdir/" install
}
