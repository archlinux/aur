# Maintainer: Chris Tam <LChris314 at gmail dot com>
pkgname=megatools-bin
pkgver=1.11.0.git.20200503
_pkgver=1.11.0-git-20200503
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

sha256sums_x86_64=('51a38ea52a6b92054d1a5c460ce320b8354ec58b860e3e09e663565c15053ce8')
sha256sums_aarch64=('c301c0cbc5cb5a81ed6585808f05ffbade3620b3bfecc9ccec0d0cddff9df45e')
sha256sums_armv7h=('3c11230bebf205b79936a9f0ee2f46e1fec9ccae7980a470fdb8270d14b10251')

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
