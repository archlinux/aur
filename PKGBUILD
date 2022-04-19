# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=typedoc
pkgver=0.22.15
pkgrel=1
pkgdesc="Documentation generator for TypeScript projects."
arch=('any')
url="https://typedoc.org/"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('08c77596ba906c5bdbc7a4bd1ba7cbe072a9dc6a08ba1ba3251796aa522f49bd93dbabc66a2fbc3acdcc75eecf9fcdf6a5761e99df4132eb985a11692f9b2dd1')

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
