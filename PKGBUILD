# Maintainer: Andy Alt <arch_stanton5995 at proton.me>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=legendofedgar
pkgver=1.38
pkgrel=1
pkgdesc="2D platformer: Venture across the world, battle fearsome creatures and solve puzzles to rescue your father."
arch=('x86_64')
url="https://www.parallelrealities.co.uk/games/edgar/"
license=('GPL-1.0-or-later')
depends=(
  'libpng'
  'sdl2'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_ttf'
  'hicolor-icon-theme'
  'zlib'
)
source=("https://github.com/riksweeney/edgar/releases/download/${pkgver}/edgar-${pkgver}-1.tar.gz")
sha256sums=('d7abc562eee9beef98ba783034541023a7a2b744f3b3f4e0d4c92a48c65d9f08')

build() {
  cd "${srcdir}/edgar-${pkgver}"

  sed -e 's|/share/games/edgar/|/share/edgar/|' -i makefile
  make
}

package()
{
  cd "${srcdir}/edgar-${pkgver}"

  make DESTDIR="${pkgdir}" BIN_DIR="${pkgdir}/usr/bin/" DATA_DIR="${pkgdir}/usr/share/edgar/" install

  rm "${pkgdir}/usr/share/doc/edgar/license"
  install -Dm644 doc/license \
    "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
