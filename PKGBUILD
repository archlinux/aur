# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.5.0
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL')
depends=('libsidplayfp>=2.5.0' 'alsa-lib' 'gcc-libs' 'glibc')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}.install")

sha256sums=('6782c42a40465ac1be9fdd231735c697732e0978926d1068aa17e15d131e810a'
            '4064bb649615a6d8825b7dcddb9880dd766169591e2643b631ef3b6c12171a33')

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

