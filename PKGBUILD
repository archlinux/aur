# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=reicast-git
pkgver=r1078.0783875
pkgrel=1
pkgdesc="A multiplatform Sega Dreamcast emulator (development version)"
arch=('i686' 'x86_64')
url="http://reicast.com/"
license=('GPL2' 'BSD' 'MIT')
conflicts=('reicast')
provides=('reicast')
makedepends=('git')
depends=('lib32-libgl' 'lib32-alsa-lib')
[ "$CARCH" == "i686" ] && depends=('libgl' 'alsa-lib')
source=(reicast::"git+https://github.com/reicast/reicast-emulator.git")
md5sums=('SKIP')

pkgver() {
  cd reicast
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd reicast/shell/lin86
  # uncomment the following line to build with GLES instead of GL 3.1
  #sed '/-DGLES/s/^#//;/-lGL /s/.*/# &/;/-lEGL/s/^#//' -i Makefile
}

build () {
  make -C reicast/shell/lin86
}

package () {
  cd reicast

  install -Dm755 shell/lin86/reicast.elf "$pkgdir"/usr/bin/reicast
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
