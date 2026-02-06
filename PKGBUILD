# Maintainer: Alberto Bonizzi <aseoista at gmail dot com>

pkgname=nurv-bin
pkgver=2.0.0
pkgrel=2
pkgdesc="Assumption Based Runtime Verificaton tool built on nuXmv"
arch=('x86_64')
url="https://es-static.fbk.eu/tools/nurv/"
license=('LicenseRef-NuRV-FBK-License')
provides=('NuRV')
depends=('gcc-libs' 'glibc' 'gmp' 'libxml2-legacy' 'util-linux-libs')
makedepends=('patchelf')

source_x86_64=("https://es-static.fbk.eu/tools/nurv/releases/NuRV-${pkgver}-linuxx64.tar.bz2")

sha256sums_x86_64=('SKIP')

package() {
  _output="${srcdir}/NuRV-${pkgver}-linuxx64"
  install -Dm755 "${_output}/NuRV" "${pkgdir}/usr/bin/NuRV"
  install -Dm644 "${_output}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${_output}/LICENSE_FOR_EVALUATION.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  patchelf --replace-needed libxml2.so.2 libxml2.so.2.13.9 "${pkgdir}/usr/bin/NuRV"
}
