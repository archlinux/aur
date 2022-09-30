# Maintainer: Chris Tam <LChris314 at gmail dot com>
pkgname=megatools-bin
pkgver=1.11.0.20220519
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

sha256sums_x86_64=('dd2d0b86d5560d789c0fe3cc8c0b38a8375ccbb5156edba00d845178769f5748')
sha256sums_i686=('ea8089b6c6e4f1bb0c0629661ece814ca8d85cd1fd640819d75ffa7c6e61457f')
sha256sums_aarch64=('ae95def4ec4fc35559ffcdf082b11f53d37c3e7c5bfd05095f087424a5bd7e97')
sha256sums_armv7h=('3c7a3ac7402e158c60b6637f2b94e074ae520fd6af587db9f00e1f884696e888')

package() {
  _output="${srcdir}/megatools-${pkgver}-linux-${CARCH%v7h}"
  install -Dm755 "${_output}/megatools" "${pkgdir}/usr/bin/megatools"
  for shim in megacopy megadf megadl megaexport megaget megals megamkdir megaput megareg megarm megatest; do
    ln -s megatools "${pkgdir}/usr/bin/${shim}"
  done
  for f in LICENSE NEWS README TODO; do
    install -Dm644 "${_output}/$f" "${pkgdir}/usr/share/doc/megatools/${f}"
  done
}

