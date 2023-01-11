# Maintainer: Popolon <popolon@popolon.org>

pkgname=pekka-kana-2
pkgver=1.2.7
pkgrel=2
pkgdesc="an oldschool 2D platformer where you control a rooster called Pekka"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url="https://pistegamez.net/game_pk2.html"
license=(BSD-2-Clause)
depends=(sdl2 sdl2_image sdl2_mixer)
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/coringao/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('07485c72173e5a3a87f55e8a749bf77526dae57cb1b34c5aa2eb0e17f7bd6f7b')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 bin/pekka-kana-2  "${pkgdir}/usr/bin/pekka-kana-2"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 data/pekka-kana-2.desktop "${pkgdir}/usr/share/applications/pekka-kana-2.desktop"
  install -vDm 644 data/pekka-kana-2.png "${pkgdir}/usr/share/pixmaps/pekka-kana-2.png"

  mkdir -p "${pkgdir}/usr/share/games/${pkgname}"
  cp -a data "${pkgdir}/usr/share/games/${pkgname}/"
}
