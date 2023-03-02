# Maintainer: Chris Tam <LChris314 at gmail dot com>
pkgname=megatools-bin
pkgver=1.11.1.20230212
pkgrel=1
pkgdesc='Command line client application for Mega.nz. Precompiled.'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://megatools.megous.com'
license=('GPL')
provides=('megatools')
conflicts=('megatools')

source_x86_64=("https://megatools.megous.com/builds/builds/megatools-${pkgver}-linux-x86_64.tar.gz")
source_i686=("https://megatools.megous.com/builds/builds/megatools-${pkgver}-linux-i686.tar.gz")
source_aarch64=("https://megatools.megous.com/builds/builds/megatools-${pkgver}-linux-aarch64.tar.gz")
source_armv7h=("https://megatools.megous.com/builds/builds/megatools-${pkgver}-linux-arm.tar.gz")

sha256sums_x86_64=('1543e155366b8931aff3cbaba2f752a5d6558c3eca857a8d82a1040924b4a970')
sha256sums_i686=('7d4c6d7d702fe76cec9bb1ad8b656ac6286ab0ab6524e1df383d3bde4e9cd196')
sha256sums_aarch64=('6a8797894d46076ba6f2dade5c5fa00297bb75ce10a84438c3e02bfc7ce12044')
sha256sums_armv7h=('e80fa4eb9dd0df798f129f6d1d45e8e68507a3dc6c70edee6f7585eb6871f5c2')

package() {
  _output="${srcdir}/megatools-${pkgver}-linux-${CARCH%v7h}"
  install -Dm755 "${_output}/megatools" "${pkgdir}/usr/bin/megatools"
  for shim in megacopy megadf megadl megaexport megaget megals megamkdir megaput megareg megarm megatest; do
    ln -s megatools "${pkgdir}/usr/bin/${shim}"
  done
  for f in NEWS README TODO; do
    install -Dm644 "${_output}/$f" "${pkgdir}/usr/share/doc/megatools/${f}"
  done
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/licenses/megatools/LICENSE"
}

