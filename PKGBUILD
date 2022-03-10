# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=phpactor
pkgver=0.18.0
pkgrel=1
pkgdesc="PHP completion, refactoring, introspection tool and language server"
arch=(any)
url="https://github.com/phpactor/phpactor"
license=(MIT)
depends=(php)
makedepends=(composer)
optdepends=('composer: faster class location and more features'
  'git: faster refactorings in your repository scope')
provides=(phpactor)
source=("https://github.com/phpactor/phpactor/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("7e4ccf68bec067d163b21f88f6fdcb4cf3af3ac36cfbba4934b392d49a67ee17")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  LIB_DIRECTORY="$pkgdir/usr/lib/$pkgname"
  mkdir -p "$pkgdir/usr/bin" "$LIB_DIRECTORY"

  cp -r . "$LIB_DIRECTORY"
  composer install --no-interaction --working-dir "$LIB_DIRECTORY"

  ln -s "$LIB_DIRECTORY/bin/phpactor" "$pkgdir/usr/bin/phpactor"
}
