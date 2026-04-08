# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>

pkgname=canfigger
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight configuration file parser library"
arch=('x86_64')
url="https://andy5995.github.io/canfigger/"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=(
  'meson'
  'ninja'
)

source=("https://github.com/andy5995/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('3d813e69e0cc3a43c09cf565138ac1278f7bcea74053204f54e3872c094cb534')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
