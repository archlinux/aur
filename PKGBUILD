# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gitlab-ci-local
pkgver=4.56.2
pkgrel=1
pkgdesc="Run gitlab pipelines locally as shell executor or docker executor"
arch=(any)
url="https://github.com/firecow/gitlab-ci-local"
license=(MIT)
depends=(nodejs)
makedepends=(
  npm
  python
)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('97895a6f81f50ac0ff6eda4c807453ac7fc4608de634d993f954743caf1a5cd9')

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
