# Maintainer: Boris Timofeev <btimofeev@emunix.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead-git
pkgver=master
pkgrel=1
conflict=('instead')
pkgdesc="a quest interpreter"
arch=('i686' 'x86_64')
url="https://github.com/instead-hub/instead"
license=('MIT')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'gtk3' 'luajit')
makedepends=('cmake')
optdepends=('instead-launcher: install and update INSTEAD games from net','insteadman: Manager for INSTEAD interpreter.')
source=(git+https://github.com/instead-hub/instead.git)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/instead"
  mkdir -p build
  cd build
  CFLAGS="-isystem /usr/include/harfbuzz" cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LUAJIT=1 \
    -DWITH_GTK3=1 \
    "${srcdir}"/instead
  make
}

package() {
  cd "${srcdir}/instead/build"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd "${srcdir}/instead"
  install -Dm0644 COPYING "$pkgdir"/usr/share/licenses/instead/COPYING
}


