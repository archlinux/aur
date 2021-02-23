# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='kclock'
pkgver=0.4.0
pkgrel=1
pkgdesc='Convergent clock application for Plasma'
arch=('x86_64' 'aarch64')
url='https://invent.kde.org/plasma-mobile/kclock'
license=('GPL2')
depends=('hicolor-icon-theme' 'plasma-framework')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('11f2e11499357e9adf13d2e07b0ba77661e29bea245facd2afc0738920b814bc')

build() {
  cmake -B 'build' -S "${pkgname}-v${pkgver}" \
    -DBUILD_TESTING=OFF
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${pkgname}-v${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
