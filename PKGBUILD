# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-color-utils -> dfl-config-parser

_pkgname=config-parser
pkgname=dfl-config-parser
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="A Collection of Config Parsers for DFL. Currently it contains a config parser for KDE Color Schemes"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'dfl-color-utils')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
md5sums=('c8451b4cd29beb9c9eecd38965c0c543')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
