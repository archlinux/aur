# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=stone-phaser
pkgver=0.1.2
pkgrel=1
pkgdesc="A classic analog phaser effect LADSPA, LV2 and VST2 plugin"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/stone-phaser"
license=('Boost')
depends=('cairo')
makedepends=('mesa')
#optdepends=('mod-ui: for using the MOD pedal GUI')
groups=('pro-audio' 'ladspa-plugins' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/jpcima/stone-phaser/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cd19c588469125e4aff3add2a570b4b2d9dc98ef37ccc2785636a0b52df86ddf')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/dpf"
  patch -N -r - -p 1 -i ../resources/patch/DPF-bypass.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
