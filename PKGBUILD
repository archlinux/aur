# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ast
pkgver=0.1.2
pkgrel=1
pkgdesc="Extension exposing PHP 7 abstract syntax tree."
url="https://github.com/nikic/php-ast"
license=("BSD")
arch=("any")
depends=("php>=7")
makedepends=("php>=7")
backup=("etc/php/conf.d/ast.ini")
source=("https://github.com/nikic/php-ast/archive/v${pkgver}.tar.gz" "ast.ini")
sha512sums=('07c41703139d037d0f7b0338faaa73b2c8ea807d58a2a3efcc4ac32eed79a667436177d47ce597467799e8d16c77e3c45c37b05b966a4941bee600a2dbe57296'
            'a99dcb98e597dc2634f51ae9af80dce82350c0f0e45ec9c2eda23d53f40c06cfd2573fafe0660304b4ceb51f3d12a3f81445f3063ece1ca1166fb50a4d3967a8')

build() {
  cd $srcdir/$pkgname-$pkgver

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/ast.ini $pkgdir/etc/php/conf.d/ast.ini
  install -Dm744 modules/ast.so $pkgdir/usr/lib/php/modules/ast.so
}

# vim:set ts=2 sw=2 et:
