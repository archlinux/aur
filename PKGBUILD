# Maintainer: Mohamad Obeid <mobeid nine nine nine nine at gmail dot com>

pkgname=signal-styler
pkgver=1.0.0
pkgrel=1
pkgdesc="Add custom CSS to Signal Desktop"
arch=('any')
url="https://github.com/m-obeid/signal-styler"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('SKIP')

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
