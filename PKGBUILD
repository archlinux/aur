# Maintainer: Robert Schiele <rschiele@gmail.com>
# Contributor: pikl <me@pikl.uk>
# Contributor: Markus Hartung <mail@hartmark.se>
# Contributor: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Jason Lenz <Jason@Lenzplace.org>
_pkgname=oscar
pkgname=oscar
pkgver=1.6.1
pkgrel=2
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment. Fork of the sleepyhead project."
arch=('i686' 'x86_64')
url="https://gitlab.com/CrimsonNape/OSCAR-code"
license=('GPL-3.0-only')
depends=(
  'qt5-tools'
  'qt5-serialport'
)
optdepends=(
  'qt5-wayland'
)
makedepends=(
  'git'
  'glu'
)
provides=("$_pkgname")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/CrimsonNape/OSCAR-code/-/archive/v${pkgver}/OSCAR-code-v${pkgver}.tar.gz"
  'oscar.desktop'
)
sha256sums=('0282f4e8347c3e52911be1809eae8832da64e961cae9c968278a0a6fbceb5d51'
            '6b2f735622f218e2ac5ef61475886fadfeeedd5f15b04fa0d54451162ee394ad')

prepare() {
  cd "${srcdir}/OSCAR-code-v${pkgver}"
  sed -i -e 's/" ) + appName/oscar" )/' oscar/SleepLib/common.cpp
}

build() {
  cd "${srcdir}/OSCAR-code-v${pkgver}"
  qmake OSCAR_QT.pro
  make
}

package() {
  cd "${srcdir}/OSCAR-code-v${pkgver}"
  install -Dm755 oscar/OSCAR "$pkgdir/usr/bin/oscar"
  install -Dm644 oscar/icons/logo-lg.png "$pkgdir/usr/share/oscar/icon.png"
  install -Dm644 ../oscar.desktop "$pkgdir/usr/share/applications/oscar.desktop"
  cp -dpr --no-preserve=ownership oscar/Html "$pkgdir/usr/share/oscar"
  cp -dpr --no-preserve=ownership oscar/Translations "$pkgdir/usr/share/oscar"
}
