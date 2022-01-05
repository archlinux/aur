# Maintainer: 
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-git
_pkgname=pcem
pkgver=r1790.30ca71f
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('wxgtk2' 'openal' 'sdl2' 'alsa-lib')
makedepends=('git' 'cmake')
conflicts=('pcem')
source=("git+https://github.com/sarah-walker-pcem/pcem.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pcem"
  cmake .. -DCMAKE_BUILD_TYPE=Release .  -DUSE_NETWORKING=ON  -DUSE_ALSA=ON
  make
}

package() {
  cd "${srcdir}/pcem"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  # I do not find a cmake install, so I had to create everything line by line :(
  cd "${pkgdir}/usr"
  mkdir bin
  cp "${srcdir}/pcem/output/bin/pcem" "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:

