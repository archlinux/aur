# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=python2-pygame-sdl2-git
_pkgname=pygame_sdl2
pkgver=219.4babc4e
pkgrel=1
pkgdesc="A new, SDL2-based implementation of the Pygame API (dev channel)"
arch=('i686' 'x86_64')
url="https://github.com/renpy/$_pkgname"
license=('LGPL2.1' 'zlib')
depends=('sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git')
provides=('python2-pygame-sdl2')
conflicts=('python2-pygame-sdl2')
source=("git://github.com/renpy/$_pkgname.git"
        'cython.patch')
md5sums=('SKIP'
         '5d3aee6b640b5e58bf98442eb443eef3')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  patch -Np0 -i ../cython.patch
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir" || return 1
}
