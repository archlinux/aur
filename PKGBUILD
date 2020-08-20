# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgver="0.1.1-beta"
pkgname=midiomatic
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A collection of MIDI filter, generator and processor LV2 and VST plugins"
arch=('i686' 'x86_64')
url="https://github.com/SpotlightKid/midiomatic"
license=('MIT')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
source=(
    "https://github.com/SpotlightKid/midiomatic/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
)
sha256sums=('d3bd9fba0581279eefa9d9b354c8da7b1ae335251498e2c12ea8f46056bed5d0')


build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  # install plugin LV2 bundles and VST binaries
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  # readme
  install -Dm644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}

  # license file
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
