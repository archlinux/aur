# Maintainer: Chris Tam <LChris314 at gmail dot com>
pkgname=megatools-bin
_pkgver=1.11.0-git-20211030
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

sha256sums_x86_64=('a08a77d2a4fad844eb8fc28518a82090bcc6f5be2c10f089ec144c10386622a1')
sha256sums_aarch64=('b8101a8f0477fd04dbf6b256450873991b02a205008a2b29c41bca82dc37fcc8')
sha256sums_armv7h=('340ac5b349552c33038873151b992de9ddf8f7dc3a5ee427ed66066222f8a50a')

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
