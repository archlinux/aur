# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=php73-ast
_pkgname=php-ast
pkgver=1.0.3
pkgrel=1
pkgdesc="Extension exposing PHP 7 abstract syntax tree."
url="https://github.com/nikic/php-ast"
license=("BSD")
arch=("any")
depends=("php73>=7")
makedepends=("php73>=7")
backup=("etc/php73/conf.d/ast.ini")
source=("https://github.com/nikic/php-ast/archive/v${pkgver}.tar.gz" "ast.ini")
sha512sums=('43a08f3a88c8a55522230d0779cb9339d833754748ce34bb9e59be8282174df0632e204167891540d05860197ef17a9f7a99f8dd98d6ec5f738b5f1bbdab59d5'
            'a99dcb98e597dc2634f51ae9af80dce82350c0f0e45ec9c2eda23d53f40c06cfd2573fafe0660304b4ceb51f3d12a3f81445f3063ece1ca1166fb50a4d3967a8')

build() {
  cd $srcdir/$_pkgname-$pkgver

  phpize73
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/ast.ini $pkgdir/etc/php73/conf.d/ast.ini
  install -Dm744 modules/ast.so $pkgdir/usr/lib/php73/modules/ast.so
}

# vim:set ts=2 sw=2 et:
