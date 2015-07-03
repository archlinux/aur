# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ja2-stracciatella-git
pkgver=7404.12d8987
pkgrel=1
pkgdesc="Jagged Alliance 2 Stracciatella project with a goal of improving JA2"
arch=('i686' 'x86_64')
url="https://bitbucket.org/gennady/ja2-stracciatella"
license=('custom')
depends=('sdl' 'gcc-libs')
makedepends=('git')
source=('git+https://bitbucket.org/gennady/ja2-stracciatella.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ja2-stracciatella"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/ja2-stracciatella"

  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/ja2-stracciatella"

  # change the dirs for installation
  sed -i "s|/usr|$pkgdir/usr|" Makefile.config
  make install

  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "SFI Source Code license agreement.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
