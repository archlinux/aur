# Maintainer:  Trần Nam Tuấn <tuantran1632001@gmail.com>
# Contributor: Jona Miller <miller dot jona at yandex dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='headsetcontrol'
_pkgname='HeadsetControl'
pkgver=3.1.0
pkgrel=1
pkgdesc='Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro) in Linux and MacOSX '
arch=('x86_64')
url='https://github.com/Sapd/HeadsetControl'
provides=("${pkgname}")
license=('GPL-3.0-only')
depends=('hidapi')
makedepends=('cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/headsetcontrol-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig::${url}/releases/download/${pkgver}/headsetcontrol-${pkgver}.asc"
)
sha256sums=('caba01afa69477f0a4fce1f8608a0c5e85e7032c350c1239bb4e1ecdfb171359'
            'SKIP')
validpgpkeys=(
  '77BEB7E232CF1E5154777D4DD5866C58940197BF' # Denis Arnst <git@sapd.eu>
)

build() {
  cmake -B 'build' -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  # Upstream extract version string from git.
  sed "s/@GIT_VERSION@/${pkgver}/g" "${_pkgname}-${pkgver}/src/version.h.in" > "${_pkgname}-${pkgver}/src/version.h"

  cmake --build 'build'
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
