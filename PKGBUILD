# Maintainer: jxir <aur@jxir.de>

pkgname=katex
pkgver=0.13.3
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=('any')
url='https://katex.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('02d8b84e845261b5e4095cd18e34d93d84a4c600dc94d21d767d58038b10c4bf')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
