# Maintainer: Christoph Brill <egore911@gmail.com>

pkgname=typedoc
pkgver=0.15.5
pkgrel=1
pkgdesc="Documentation generator for TypeScript projects."
arch=('any')
url="https://typedoc.org/"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('00a5cbb4e5022d19524f27d7407629dcb14fcba46214b9f19ca4b9cf58f042c6179823db1d6ba199f812dbae04b3684f3198f3bc7aa4fd9403cc20696f8f6eeb')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
