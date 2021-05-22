# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Sean Bolton <sean at smbolton dot com>

pkgname=whysynth
pkgver=20170701
pkgrel=2
pkgdesc="A versatile softsynth plugin for the DSSI Soft Synth Interface"
url="http://www.smbolton.com/whysynth.html"
depends=('alsa-lib' 'liblo' 'gtk2' 'fftw')
makedepends=('dssi' 'ladspa')
conflicts=('whysynth-git')
license=('GPL')
source=(http://www.smbolton.com/whysynth/${pkgname}-${pkgver}.tar.bz2)
md5sums=('217bfeea23545c12cd0a1bc93de6ed0f')
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
