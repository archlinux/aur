# Maintainer: Chris Tam <LChris314 at gmail dot com>
pkgname=megatools-bin
_pkgver=1.11.0-git-20200830
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='Command line client application for Mega.nz. Precompiled.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://megatools.megous.com'
license=('GPL')
provides=('megatools')
conflicts=('megatools')

source_x86_64=("https://megatools.megous.com/builds/experimental/megatools-${_pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://megatools.megous.com/builds/experimental/megatools-${_pkgver}-linux-aarch64.tar.gz")
source_armv7h=("https://megatools.megous.com/builds/experimental/megatools-${_pkgver}-linux-arm.tar.gz")

sha256sums_x86_64=('ec701c771b7c792f4626ae2d243bc6bd9d3b3c809daac6607b2ee19eb0560462')
sha256sums_aarch64=('85c7c52214f70ac97ef7e251c5f2a17db2ec3b4366ede519031976653ac3701f')
sha256sums_armv7h=('f37095115028d7f1be5ec02c95f0b46ca02113c08d0555b9a00edd2b9f5c115f')

package() {
  _output="${srcdir}/megatools-${_pkgver}-linux-${CARCH%v7h}"
  install -Dm755 "${_output}/megatools" "${pkgdir}/usr/bin/megatools"
  for shim in megacopy megadf megadl megaexport megaget megals megamkdir megaput megareg megarm megatest; do
    ln -s megatools "${pkgdir}/usr/bin/${shim}"
  done
  for f in LICENSE NEWS README TODO; do
    install -Dm644 "${_output}/$f" "${pkgdir}/usr/share/doc/megatools/${f}"
  done
}
