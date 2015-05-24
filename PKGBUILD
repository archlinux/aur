# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=reicast-git
pkgver=r1200.a9fc0f5
pkgrel=1
pkgdesc="A multiplatform Sega Dreamcast emulator (development version)"
arch=('i686' 'x86_64')
url="http://reicast.com/"
license=('GPL2' 'BSD' 'MIT')
conflicts=('reicast')
provides=('reicast')
makedepends=('git')
depends_x86_64=('lib32-libgl' 'lib32-alsa-lib')
depends_i686=('libgl' 'alsa-lib')
source=(reicast::"git+https://github.com/reicast/reicast-emulator.git")
md5sums=('SKIP')

pkgver() {
  cd reicast
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
