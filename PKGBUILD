# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=far2l-git
pkgver=r680.c87ad2f
pkgrel=3
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('i686' 'x86_64')
license=('GPL2')
source=('git+https://github.com/elfmz/far2l'
        'far2l_install.patch')
sha256sums=('SKIP'
            '22ed1b899a2855afd4adb8e1cb81703dd56ade20e6449f893181232999b4cab4')
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

  ln -sf ../../bin/far2l "$pkgdir"/usr/lib/far2l/far2l_askpass
  ln -sf ../../bin/far2l "$pkgdir"/usr/lib/far2l/far2l_sudoapp
}
