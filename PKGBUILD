# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=matrixmixer32.lv2-git
pkgdesc="NxM Matrix Mixer LV2 Plugin"
pkgver=r33.13fe883
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/x42/matrixmixer.lv2"
license=(GPL)
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/x42/matrixmixer.lv2)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd matrixmixer.lv2
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd matrixmixer.lv2
  make submodules
}

build() {
  cd matrixmixer.lv2
  sed -i '38s/matrixmixer/matrixmixer32/' Makefile
  make N_INPUTS=32 N_OUTPUTS=32 
}

package() {
  cd matrixmixer.lv2
  BUILDJACKAPP="no" PREFIX=/usr	make DESTDIR="$pkgdir/" install
}
