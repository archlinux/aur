# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=typedoc
pkgver=0.25.1
pkgrel=1
pkgdesc="Documentation generator for TypeScript projects."
arch=('any')
url="https://typedoc.org/"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('736c9edd852d18869dc4dd8ee98c0f11782b65cbe1959e87961599f23411373c0b3e7db2961746a9d47c1dbc8347200b3fc27a9664803482c292421d34f171a8')

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
