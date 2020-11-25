# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Fluida.lv2
pkgname="${_projectname,,}"
pkgver=0.5
pkgrel=1
pkgdesc="An LV2 plugin which wraps the fluidsynth SF2 soundfont player"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_projectname}"
license=('GPL2')
depends=('cairo')
makedepends=('fluidsynth' 'lv2')
groups=('lv2-plugins' 'pro-audio')
source=(
    "https://github.com/brummer10/${_projectname}/releases/download/v${pkgver}/${_projectname%*.lv2}_${pkgver}.tar.gz"
)
sha256sums=('edcc4bb29a986490be2a55234cd196e523a69ded0e8c16c7a4e721c0ef2b232a')


build() {
  cd "${srcdir}/${_projectname%*.lv2}_${pkgver}"
  make
}

package() {
  depends+=('libfluidsynth.so')
  cd "${srcdir}/${_projectname%*.lv2}_${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
