# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=stone-phaser
pkgver=0.1.1
pkgrel=1
pkgdesc="A classic analog phaser effect LADSPA, LV2 and VST2 plugin"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/stone-phaser"
license=('Boost')
depends=('cairo')
makedepends=('mesa')
#optdepends=('mod-host: for using the MOD pedal GUI')
groups=('pro-audio' 'ladspa-plugins' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/jpcima/stone-phaser/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7fd1b688c1ddb0d350028bec6141fedde7ec523354681adc4548b32be132c882')


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
