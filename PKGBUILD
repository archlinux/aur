# Maintainer: Antiquete <antiquete@proton.me>

pkgname=mmconneqt-git
pkgver=v0.1.1.r2.gc61b42a
pkgrel=1
pkgdesc="A simple Qt based gui for ModemManager"
arch=('x86_64')
url="https://gitlab.com/Antiquete/mmconneqt"
license=('GPL3')
depends=('qt5-base' 'modemmanager')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'ac2d984d9c86da3a7af523e99b3f31796b8063c60056319d61688fd3cc8c4766')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  mkdir build && cd build
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" ../MMConneqt.pro
  make
  install -Dm644 "${srcdir}/${pkgname%-git}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname%-git}/COPYING"
  install -Dm755 "${srcdir}/${pkgname%-git}/build/mmconneqt" "${pkgdir}/usr/bin/mmconneqt"
  install -Dm644 "${srcdir}/${pkgname%-git}/src/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "${srcdir}/mmconneqt.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
