# Maintainer: gee

pkgname=higan-bsnes
pkgver=108
pkgverR=108
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
source=("https://download.byuu.org/bsnes_v${pkgverR}-source.7z")
sha256sums=('49c560b8438d0ea3942b1cd90ac3d4b5a33074eca77a0b24a7af463e87187bec')

#root issue in package
prepare() {
  cd bsnes_v${pkgverR}-source/bsnes/target-bsnes
  sed -i "41,42d" GNUmakefile
  sed -i '41s/^.....//' GNUmakefile
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
