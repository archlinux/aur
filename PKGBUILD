# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=dealers-choice
pkgver=0.0.13
pkgrel=1
pkgdesc="Online Multiplayer Stud and Draw Poker, Texas Hold'em and Omaha"
arch=('x86_64')
url="https://github.com/Dealer-s-Choice/dealers-choice"
license=('MIT')
depends=(
  'glibc'
  'libsodium'
  'sdl2'
  'sdl2_ttf'
  'sdl2_image'
  'sdl2_net'
  'protobuf-c'
  'hicolor-icon-theme'
)
optdepends=('canfigger: use system-installed version')
makedepends=(
  'meson'
  'ninja'
)

source=("https://github.com/Dealer-s-Choice/dealers_choice/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ad9f927eee79f0264fb3d99a258dc0e377ba41507d679066110e388be8dfd8d8')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
