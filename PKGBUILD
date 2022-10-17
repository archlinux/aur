# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

pkgname=libdesq
pkgver=0.0.7
pkgrel=1
pkgdesc="The DesQ library to handle X11 protocols, system calls, classes and functions to be used across the DesQ project."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${pkgname}"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('309dcac10d71352853c7eb69db60c2b1')

build() {
  cd "${pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
