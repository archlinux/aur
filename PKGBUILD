# Maintainer: gee

pkgname=higan-bsnes
pkgver=107.2
pkgverR=107r2
pkgrel=1
pkgdesc='Nintendo SNES emulator, faster flavor of higan'
arch=('x86_64')
url='http://byuu.org/'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv'
         'openal' 'pango' 'sdl'
         'libudev.so')
conflicts=('bsnes' 'bsnes-classic')
source=("https://download.byuu.org/bsnes_v${pkgverR}-source.7z")
sha256sums=('527dbbd9957465183a14c2e8ef8767b493d8542b6b8f10e5fd5f99eb46e94bb0')

#root issue in package
prepare() {
  cd bsnes_v${pkgverR}-source/bsnes/target-bsnes
  sed -i "37,38d" GNUmakefile
  sed -i '37s/^.....//' GNUmakefile
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
