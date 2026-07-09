# Maintainer: SmallClover <aur at clvr dot one>

pkgname=plasma6-applets-kara
pkgver=1.0.0
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
)

source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/kara"

  git fetch --tags
  git checkout "v${pkgver}"
}

build() {
  cd "$srcdir/kara"

  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/kara"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
