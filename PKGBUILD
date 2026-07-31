# Maintainer: Andy Alt <arch_stanton5995 at proton.me>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.10.0
pkgrel=1
pkgdesc="trash/recycle bin utility for the command line"
arch=('x86_64')
url="https://theimpossibleastronaut.com/rmw-website/"
license=('GPL-3.0-or-later')
depends=(
  'canfigger'
  'glib2'
  'ncurses'
)
optdepends=('canfigger: use system-installed version')
makedepends=(
  'meson'
  'ninja'
)

source=("https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8f96fd96831b69bffc8019cb000483ffe92a7764765484df57f63a6515d26fd9')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
