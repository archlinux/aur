# Maintainer: Sebastian Meyer <aur@mailhell.seb7.de> 
# Contributor: Pedro H. Lara Campos <root@pedrohlc.com>

_pkgname=sdl2_compat12
pkgname=sdl2_compat12-git
provides=('sdl=1.12.15')
conflicts=('sdl')
pkgver=r285.646ecd7
pkgrel=1
pkgdesc="Provides a binary-compatible API for programs written against SDL 1.2, but it uses SDL 2.0 behind the scenes."
url=https://github.com/libsdl-org/sdl12-compat.git
arch=('i686' 'x86_64' 'armv7h')
license=('ZLIB')
depends=('sdl2' 'glu')
makedepends=('cmake' 'git')
source=('git+https://github.com/libsdl-org/sdl12-compat.git' 'fix-cmakelists.patch' 'fix-srcdir-reference.patch')
sha256sums=('SKIP'
            '6b89938e36ceafbe0e5fec87aa03606c20166890ea73320e5fabf4fd2c3ff4b5'
            'e59519698276b34277a76746b84c06afe5f21037e3c4a5a8e8f913306f0bd812')

pkgver() {
  cd sdl12-compat 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd sdl12-compat
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "sdl12-compat"
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

