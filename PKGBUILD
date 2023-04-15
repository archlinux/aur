# Maintainer: Antiquete <antiquete@proton.me>

pkgname=mmconneqt-git
pkgver=v0.1.0.r0.g84d2892
pkgrel=1
pkgdesc="A simple Qt based gui for ModemManager"
arch=(any)
url="https://gitlab.com/Antiquete/mmconneqt"
license=('GPL3')
depends=(qt5-base)
makedepends=(git)
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  mkdir build && cd build
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" ../MMConneqt.pro
  make
  install -Dm755 mmconneqt "${pkgdir}/usr/bin/mmconneqt"
}
