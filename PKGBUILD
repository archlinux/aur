# Maintainer: Josué M. Sehnem <josue@sehnem.com>
pkgname=headsetcontrol-git
pkgver=r80.0498a13
pkgrel=1
pkgdesc="Sidetone support for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro) in Linux"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('hidapi')
makedepends=('cmake')
provides=('headsetcontrol')
install=headsetcontrol.install
source=("${pkgname}"'::git+https://github.com/Sapd/HeadsetControl')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make DESTDIR="${pkgdir}" install
}
