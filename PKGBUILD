# Maintainer: Antiquete <antiquete@proton.me>

pkgname=mmconneqt-git
_pkgname=${pkgname%-git}
pkgver=v0.1.1.r1.gface047
pkgrel=3
pkgdesc="A simple Qt based gui for ModemManager"
arch=(any)
url="https://gitlab.com/Antiquete/mmconneqt"
license=('GPL3')
depends=(qt5-base)
makedepends=(git)
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=(mmconneqt.desktop "git+$url.git")
sha256sums=('ac2d984d9c86da3a7af523e99b3f31796b8063c60056319d61688fd3cc8c4766' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  mkdir build && cd build
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" ../MMConneqt.pro
  make
  install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm755 "${srcdir}/${_pkgname}/build/mmconneqt" "${pkgdir}/usr/bin/mmconneqt"
  install -Dm644 "${srcdir}/${_pkgname}/src/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}/src/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/mmconneqt.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
