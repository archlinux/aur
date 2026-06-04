# Maintainer: Pavel Dobiáš <mail@paveldobias.eu>

pkgname=kf6-kio-ftps
pkgver=0.4
pkgrel=1
pkgdesc='A port of FTPS kioworker to KDE Frameworks 6.'
arch=(x86_64)
url='https://github.com/efeciftci/kf6-kio-ftps'
license=('GPL-2.0')
depends=(
  kio
)
makedepends=(
  cmake
  extra-cmake-modules
  qt6-base
  kcoreaddons
  ki18n
  kwidgetsaddons
  kconfig
)
provides=("${pkgname}" "kio-ftps")
conflicts=("kio-ftps")
options=(!debug)

source=(
  "https://github.com/efeciftci/${pkgname}/archive/refs/tags/v${pkgver}.zip"
)

sha256sums=(
  'e49c327243b226d70f1f067247b35c27f511d02c93672104bc4e504efa12befa'
)

build() {
  cmake -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
