# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.10.0
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL-2.0-only')
depends=('libsidplayfp>=2.9.0' 'alsa-lib' 'gcc-libs' 'glibc')
optdepends=('libpulse')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('be44d718566dc73ee2c4ef4705e17a46cb32377ef272ffdbc274a2b2d9f7b0a8')

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

