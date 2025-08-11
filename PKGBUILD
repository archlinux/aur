# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=dealers-choice
pkgver=0.0.8
pkgrel=1
pkgdesc="Online Multiplayer Stud and Draw Poker"
arch=('x86_64' 'aarch64')
url="https://github.com/Dealer-s-Choice/dealers_choice"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_net' 'protobuf-c' 'hicolor-icon-theme')
makedepends=('cmake' 'meson' 'ninja')

source=("https://github.com/Dealer-s-Choice/dealers_choice/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1946976cd3176091d4b16f5ebdc575bab285051808a8b5e49600c32bb6314eb4')

build() {
  arch-meson $pkgname-$pkgver build -Db_sanitize=none
  meson compile -v -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
