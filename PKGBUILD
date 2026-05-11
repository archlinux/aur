# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>

pkgbase=canfigger
pkgname=('canfigger' 'canfigger-docs')
pkgver=0.3.2
pkgrel=1
pkgdesc="Lightweight configuration file parser library with XDG path helpers"
arch=('x86_64')
url="https://andy5995.github.io/canfigger/"
license=('MIT')
makedepends=(
  'meson'
  'ninja'
)

source=("https://github.com/andy5995/${pkgbase}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('f128a62cec50cce16e1e8c87012f8564d972b663316b27358d1d7f6b4486bec8')

build() {
  arch-meson "${pkgbase}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package_canfigger() {
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf "${pkgdir}/usr/share/doc/${pkgbase}/html"
  rm -f "${pkgdir}/usr/share/doc/${pkgbase}/LICENSE"
  install -Dm 644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/canfigger"
}

package_canfigger-docs() {
  pkgdesc="HTML API documentation for canfigger"
  arch=('any')
  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -r "${srcdir}/${pkgbase}-${pkgver}/docs/." "${pkgdir}/usr/share/doc/${pkgbase}/html"
  install -Dm 644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/canfigger-docs"
}
