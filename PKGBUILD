# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=efte
pkgver=1.1
pkgrel=1
pkgdesc="Fast configurable programmers editor"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/efte/"
license=('GPL' 'custom')
depends=('libxpm' 'desktop-file-utils')
makedepends=('cmake')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f92974f8f438842bae3b837fe6eff099')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  cmake -DBUILD_X=ON \
        -DBUILD_CONSOLE=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
#license
  install -Dm644 Artistic "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
