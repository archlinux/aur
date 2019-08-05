# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=string-machine
pkgver=0.1.0
pkgrel=1
pkgdesc="A virtual-analog string ensemble synthesizer LV2 and VST2 plugin"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/string-machine"
license=('Boost')
depends=('cairo')
makedepends=('boost' 'git' 'mesa')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/jpcima/string-machine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5b0d2eb2185199c1de6c7c35700a2caafbc6ba564529a2e7614c15c3aceacc6f')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create installation directories
  install -dm755 "${pkgdir}"/usr/lib/vst
  install -dm755 "${pkgdir}"/usr/lib/lv2/${pkgname}.lv2
  # LV2 bundle
  install -Dm644 bin/${pkgname}.lv2/*.ttl -t \
    "${pkgdir}"/usr/lib/lv2/${pkgname}.lv2
  install -Dm755 bin/${pkgname}.lv2/*.so -t \
    "${pkgdir}"/usr/lib/lv2/${pkgname}.lv2
  # VST shared library
  install -m755 bin/${pkgname}-vst.so "${pkgdir}"/usr/lib/vst
}
