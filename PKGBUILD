# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-wayqt -> dfl-clipboard

_pkgname=clipboard
pkgname=dfl-clipboard
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="Clipboard Manager based on wlroots data control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('f9ea24134d1819b70ebe009444a95d33')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
