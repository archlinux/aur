# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-color-utils -> dfl-config-parser

_pkgname=config-parser
pkgname=dfl-config-parser
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="A Collection of Config Parsers for DFL. Currently it contains a config parser for KDE Color Schemes"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'dfl-color-utils')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('4382f13798b525d77297b6fec6ff6486')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
