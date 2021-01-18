# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgver="0.2.0"
pkgname=midiomatic
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="A collection of MIDI filter, generator and processor LV2 and VST plugins"
arch=('i686' 'x86_64')
url="https://github.com/SpotlightKid/midiomatic"
license=('MIT')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
depends=('gcc-libs')
source=(
    "https://github.com/SpotlightKid/midiomatic/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
)
sha256sums=('06be064b2868a6ba140f7bc8d4ef7b7e675454dd7ef5b5c54e22e8ccf8e77628')


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
