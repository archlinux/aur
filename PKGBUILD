# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=kalibrate-bladerf-git
pkgver=6ac8204
pkgrel=2
pkgdesc='Fork of http://thre.at/kalibrate/ for use with the bladeRF SDR'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/Nuand/kalibrate-bladeRF'
provides=('kalibrate-rtl')
depends=("bladerf" "fftw")
makedepends=('git')
source=("${pkgname}::git+https://github.com/Nuand/kalibrate-bladeRF")
md5sums=('SKIP')

pkgver () {
    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's|-|.|g'
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
