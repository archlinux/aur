# Maintainer: SmallClover <aur at clvr dot one>

pkgname=plasma6-applets-kara
pkgver=1.1.0
pkgrel=1
pkgdesc="KDE Plasma Pager Applet"
arch=('any')
url="https://github.com/dhruv8sh/kara"
license=('GPL-3.0-only')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
depends=()
options=()
makedepends=(
  'git'
  'base-devel'
  'cmake'
  'extra-cmake-modules'
  'qt6-base'
  'qt6-declarative'
  'kwin'
  'libplasma'
  'plasma-activities'
  'plasma-workspace'
  'vulkan-headers'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/dhruv8sh/kara/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('36fde84ad0f6a984f030b057cfa515cd0e0adc83ecaf50763a77cb2efee17aa2')

build() {
  cd "$srcdir/kara-${pkgver}"

  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/kara-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
