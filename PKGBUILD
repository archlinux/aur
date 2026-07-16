# Maintainer: Pavel Dobiáš <mail@paveldobias.eu>

pkgname=kf6-kio-ftps
pkgver=0.4.1
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
#"https://github.com/efeciftci/${pkgname}/archive/refs/tags/v${pkgver}.zip"
source=(
  "https://github.com/efeciftci/${pkgname}/archive/refs/tags/0.4-1.zip"
)

sha256sums=(
  '2a99b6b6f48628f3fd1ac1dbea787427d96b02d5a80614a47bf306ab2ecff043'
)

#-S "${srcdir}/${pkgname}-${pkgver}"
build() {
  cmake -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname}-0.4-1" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
