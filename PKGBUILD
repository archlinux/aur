# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=login1
pkgname=dfl-login1
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="Implementation of systemd/elogind for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
sha256sums=('799de964c2d1126d2bec761552b2d9d33a0dafcc4eb0457655a003fb850e40c5')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
