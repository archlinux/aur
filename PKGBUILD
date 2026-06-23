# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=3.1.0
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL-2.0-only')
depends=('libsidplayfp' 'alsa-lib' 'gcc-libs' 'glibc' 'mpg123')
optdepends=('libpulse')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('58a2d6df3be7b2d4215f1a75f165a7c698d9c0dd9f8ff83a2b85fad9d55fbc59')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  autoreconf -fi -I /usr/share/gettext/m4
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

