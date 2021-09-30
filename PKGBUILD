# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=kalibrate-bladerf-git
pkgver=r20.13bd3ab
pkgrel=1
epoch=1
pkgdesc='Fork of http://thre.at/kalibrate/ for use with the bladeRF SDR'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/Nuand/kalibrate-bladeRF'
depends=("bladerf" "fftw")
makedepends=('git')
source=("${pkgname}::git+https://github.com/Nuand/kalibrate-bladeRF.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./bootstrap
  ./configure --prefix=/usr --program-suffix=-bladeRF
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
