# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gitlab-ci-local
pkgver=4.49.0
pkgrel=1
pkgdesc="Run gitlab pipelines locally as shell executor or docker executor"
arch=(any)
url="https://github.com/firecow/gitlab-ci-local"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('b39c13675240f88041b703b4fdae2a09b040db640d33fb9aaaa0d58aa8114d5d')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
