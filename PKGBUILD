# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.8.0
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL')
depends=('libsidplayfp>=2.6.0' 'alsa-lib' 'gcc-libs' 'glibc')
optdepends=('libpulse')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('98ca4d04fb1f648203e43dfa47a28c819089a5fb46142ddd062299e404d52b6c')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  autoreconf -fi
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}

