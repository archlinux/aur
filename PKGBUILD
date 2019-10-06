# Maintainer: gee

pkgname=higan-bsnes
pkgver=111r1
pkgverR=111r1
pkgrel=1
pkgdesc='Nintendo SNES emulator, faster official flavor of higan'
arch=('x86_64')
url='http://byuu.org/'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv'
         'openal' 'pango' 'sdl'
         'libudev.so')
conflicts=('bsnes' 'bsnes-classic')
source=("https://download.byuu.org/bsnes_v${pkgverR}-source.zip")
sha256sums=('de2a50bbe57d2ff59b56b1b0023ba92153d6251b6b40f7465d7a630004ae03dd')

#root issue in package
prepare() {
  cd bsnes_v${pkgverR}-source/bsnes/target-bsnes
  sed -i "42,43d" GNUmakefile
  sed -i '42s/^.....//' GNUmakefile
}

build() {
  cd bsnes_v${pkgverR}-source/bsnes

  make
}

package() {
  cd bsnes_v${pkgverR}-source/bsnes
  make prefix="${pkgdir}/usr" install

  #install -Dm 755 out/bsnes -t "${pkgdir}"/usr/bin/
  #install -Dm 644 target-bsnes/resource/bsnes.desktop -t "${pkgdir}"/usr/share/applications/
  #install -Dm 644 target-bsnes/resource/bsnes.png -t "${pkgdir}"/usr/share/pixmaps/
}
