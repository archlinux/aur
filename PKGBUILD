# Maintainer: gee

pkgname=higan-bsnes
pkgver=110
pkgverR=110
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
sha256sums=('16dfd733e9bd717547a7ebdc6af5b06ac15597fddff90df64e9115e685887dbd')

#root issue in package
prepare() {
  cd bsnes_v${pkgverR}-source/bsnes/target-bsnes
  sed -i "40,41d" GNUmakefile
  sed -i '40s/^.....//' GNUmakefile
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
