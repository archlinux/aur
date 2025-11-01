# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgname=lincity-ng
pkgname=${_pkgname}-git
epoch=1
pkgver=2.14.2.r62.g352a8419
pkgrel=1
pkgdesc="A city simulation game (development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/lincity-ng/lincity-ng"
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
license=(
  'CC-BY-SA-2.0'
  'GPL-2.0-or-later'
  'LicenseRef-ArevFontsCopyright'
  'LicenseRef-BitstreamVeraFontsCopyright'
)
depends=(
  'fmt'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libxml++-5.0'
  'libxml2'
  'sdl2'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_ttf'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
  'libxslt'
)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^lincity-ng-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  cd ${_pkgname}
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING-data.txt
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING-fonts.txt
}
