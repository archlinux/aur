pkgname=actual-cli
pkgver=26.5.2
pkgrel=1
pkgdesc="CLI for Actual Budget"
arch=('any')
url="https://github.com/actualbudget/actual"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/@actual-app/cli/-/cli-$pkgver.tgz")
noextract=("cli-$pkgver.tgz")
sha256sums=('b92ef7062bc7b18e0aa9d2c1196c92acf20bfca18b30371ea9eb7737c9e4f79a')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/cli-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
  
  # Remove cache and empty etc if they exist
  rm -rf "$pkgdir/usr/etc"
  rm -rf "$pkgdir/usr/lib/node_modules/@actual-app/cli/node_modules"/.cache
}
