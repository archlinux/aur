# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=stone-phaser
pkgver=0.1.0
pkgrel=1
pkgdesc="A classic analog phaser effect LADSPA, LV2 and VST2 plugin"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/stone-phaser"
license=('Boost')
# TODO: next release will probably include UI depending on cairo and mesa (headers only)
#depends=('cairo')
#makedepends=('mesa')
#optdepends=('mod-host: for using the MOD pedal GUI')
groups=('pro-audio' 'ladspa-plugins' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/jpcima/stone-phaser/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/jpcima/stone-phaser/master/resources/patch/DPF-bypass.patch')
sha256sums=('8d0e9422125c0a6a2515a2a536f835c08b150fd90d261cf9c1ee86668b3e70bd'
            'c9f7c7312d459da55f8291bd403449b893862533bcf92d9a4f3c23a10df781c5')


# TODO: next release will probably include LV2 UI needing this patch
#prepare() {
#  cd "${srcdir}/${pkgname}-${pkgver}/dpf"
#  patch -N -r - -p 1 -i "${srcdir}"/DPF-bypass.patch || return 0
#}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
