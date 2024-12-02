# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=solitude
pkgver=1
pkgrel=3
pkgdesc="Tomes of Solitude, a game"
arch=('x86_64' 'i686' 'aarch64')
url="https://nullwise.com/pages/tos/index.html"
license=('unknown')
depends=('sdl' 'sdl_image' 'sdl_mixer')
makedepends=('cmake' 'glu')
install=$pkgname.install
source=("https://nullwise.com/pages/tos/tomes_of_solitude_src.zip"
        "solitude.sh"
        "solitude.png"
        "solitude.desktop")
sha256sums=('57f1d76e10c6fafc6f2f59aa0d0008eb3bcfd42d849c6df879032e12bae0df50'
            '65864c882d63a57f130d1417a4919f72f1a05a02022d3d8afe779bf7f86120cf'
            'eb6ce37db9ebeb176b38f3912d7b8c43ffd7c40b0c4f90adff83499142d52e09'
            'd57be66a8d25618b31a0e12e41fb8debee52f2be87a0e8d2ad6ad0391a29e2a1')

build() {
  cd "${srcdir}/tomes_of_solitude_src"
  cmake -G "Unix Makefiles"
  make
}

package() {
  cd "${srcdir}/tomes_of_solitude_src"
  install -Dm755 tos "${pkgdir}/usr/bin/${pkgname}.elf"
  mkdir -p "${pkgdir}/usr/share/solitude"
  cp -r res "${pkgdir}/usr/share/solitude/"
  cp -r maps "${pkgdir}/usr/share/solitude/"
  cd "${srcdir}"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/solitude"
  install -Dm644 "$pkgname.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
