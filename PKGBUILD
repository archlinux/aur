# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=typedoc
pkgver=0.20.16
pkgrel=1
pkgdesc="Documentation generator for TypeScript projects."
arch=('any')
url="https://typedoc.org/"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('c6a20bf254fa644dd0a4fd06377d1c91e4d1d39352124acfda95d094d842d0e1646ef9e3a89b4351c5929823b5e41b98caee2ab046d94feb4a605100b7d2717b')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
