# Maintainer: Sean Bolton <sean at smbolton dot com>
pkgname=whysynth
pkgver=20120903
pkgrel=2
pkgdesc="A versatile softsynth plugin for the DSSI Soft Synth Interface"
url="http://www.smbolton.com/whysynth.html"
depends=('alsa-lib' 'liblo' 'gtk2' 'fftw')
makedepends=('dssi')
license=('GPL')
source=(http://www.smbolton.com/whysynth/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b521b63ade13b09062a64c46d2eabee2')
arch=('i686' 'x86_64')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1
  find ${pkgdir}/usr/lib -name '*.la' -exec rm {} \; || return 1
}
