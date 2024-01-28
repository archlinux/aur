# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=pascal-sdl2-git
pkgver=1.72.r138.201a767
pkgrel=1
pkgdesc="Pascal SDL 2 Headers"
arch=('i686' 'x86_64')
url="https://github.com/ev1313/Pascal-SDL-2-Headers"
license=('LGPL3')
depends=('fpc' 'sdl2')
optdepends=('sdl2_gfx'
            'sdl2_image'
            'sdl2_mixer'
            'sdl2_net'
            'sdl2_ttf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('staticlibs')
source=('pascal-sdl2::git+https://github.com/ev1313/Pascal-SDL-2-Headers.git')
md5sums=('SKIP')

_unitdir=`fpc -iSP`-`fpc -iSO`
_fpcver=`fpc -iV`

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  echo "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  for _file in *.pas
  do
    fpc -Mobjfpc -dRelease ${_file}
  done
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "$pkgdir"/usr/lib/fpc/${_fpcver}/${_unitdir}/sdl2
  install -m644 *.o "$pkgdir"/usr/lib/fpc/${_fpcver}/${_unitdir}/sdl2
  install -m644 *.ppu "$pkgdir"/usr/lib/fpc/${_fpcver}/${_unitdir}/sdl2
}
