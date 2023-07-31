# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=typedoc
pkgver=0.24.8
pkgrel=1
pkgdesc="Documentation generator for TypeScript projects."
arch=('any')
url="https://typedoc.org/"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('6a127a0a972fc706b17eee0ab6303ca9936a4b8df062de892f6ef0622220975bdddfc596fca597d7562e01e661bb3f6ffadb6bbad4ac80af973b50a32f5900df')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # Drop strange dirs
  rm -rf "$pkgdir/usr/lib/node_modules/root"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
