# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=gitlab-ci-local
pkgver=4.38.1
pkgrel=1
pkgdesc="Run gitlab pipelines locally as shell executor or docker executor"
arch=('any')
url="https://github.com/firecow/gitlab-ci-local"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('5259a007acbce0e6d93ee18ebbecdf344b19240ece0b23251baa00647eba71f2')

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
