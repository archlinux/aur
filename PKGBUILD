# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=far2l-git
pkgver=r680.c87ad2f
pkgrel=1
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('i686' 'x86_64')
license=('GPL2')
source=('git+https://github.com/elfmz/far2l'
        'far2l_install.patch')
sha256sums=('SKIP'
            '998bd4aaf0c316e1fd7da15c78ef8460b75a0122d33ae1a23e79da963c9ff854')
makedepends=('git' 'cmake')
depends=('wxgtk')

pkgver() {
  cd "$srcdir"/far2l
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/far2l

  patch -p1 -i "$srcdir"/far2l_install.patch
}

package() {

  cd "$srcdir"/far2l
  cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build .

  make install
}