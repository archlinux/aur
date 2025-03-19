# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=gitlab-ci-local
pkgver=4.58.0
pkgrel=1
pkgdesc="Run gitlab pipelines locally as shell executor or docker executor"
arch=(any)
url="https://github.com/firecow/gitlab-ci-local"
license=(MIT)
depends=(
  nodejs
  rsync
)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('ad42eac5b9c372675771c718e1dbccf98069cee47cd9c1f89c3f670496d1b7e1')

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
