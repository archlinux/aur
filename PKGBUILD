# Maintainer: Boris Timofeev <btimofeev@emunix.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead
pkgver=3.3.3
pkgrel=1
pkgdesc="a quest interpreter"
arch=('i686' 'x86_64')
url="https://github.com/instead-hub/instead"
license=('MIT')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'gtk3' 'luajit')
makedepends=('cmake')
optdepends=('instead-launcher: install and update INSTEAD games from net','insteadman: Manager for INSTEAD interpreter.')
source=(https://github.com/instead-hub/instead/releases/download/${pkgver}/instead_${pkgver}.tar.gz)
sha256sums=('1a39a8999254e585dbbc94b3da3ed8b28669d01c70f1f9e17864af4ad91f77b3')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  CFLAGS="-isystem /usr/include/harfbuzz" cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LUAJIT=1 \
    -DWITH_GTK3=1 \
    "${srcdir}"/$pkgname-$pkgver
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd "${srcdir}"/$pkgname-$pkgver
  cp -a doc/*.pdf doc/instead.txt doc/examples "$pkgdir"/usr/share/doc/instead/

  install -Dm0644 COPYING "$pkgdir"/usr/share/licenses/instead/COPYING
}


