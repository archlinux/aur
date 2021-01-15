# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Fluida.lv2
pkgname="${_projectname,,}"
pkgver=0.6
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
sha256sums=('7bf60dfb94f441f94fa0facd118e70ad529628a734e2402d935deeb87f490eb4')


build() {
  cd "${srcdir}/${_projectname%*.lv2}_${pkgver}"
  make
}

package() {
  depends+=('libfluidsynth.so')
  cd "${srcdir}/${_projectname%*.lv2}_${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
