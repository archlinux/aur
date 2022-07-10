# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=gitlab-ci-local
pkgver=4.32.0
pkgrel=1
pkgdesc="Run gitlab pipelines locally as shell executor or docker executor"
arch=('any')
url="https://github.com/firecow/gitlab-ci-local"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8249a87a6aa4900896aceec8971d91a6e08ca92f17f28285665a382a0bfaf5ce')

package() {
    npm install -g \
      --cache "$srcdir/npm-cache" \
      --prefix "$pkgdir/usr" \
      "$srcdir/$pkgname-$pkgver.tgz"
    install -Dm644 \
      "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
