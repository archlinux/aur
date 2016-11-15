# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ja2-stracciatella-git
pkgver=8188.a517757
pkgrel=1
pkgdesc="Jagged Alliance 2 Stracciatella project with a goal of improving JA2"
arch=('i686' 'x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
depends=('boost-libs' 'sdl2')
makedepends=('git' 'cmake' 'boost')
source=('git+https://github.com/ja2-stracciatella/ja2-stracciatella.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ja2-stracciatella"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/ja2-stracciatella"

  cmake "../ja2-stracciatella" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DEXTRA_DATA_DIR=/usr/share/ja2
  make
}

package() {
  cd "$srcdir/ja2-stracciatella"

  make DESTDIR="$pkgdir" install

  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "SFI Source Code license agreement.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
