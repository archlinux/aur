# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=nodejs-lhci-cli
pkgver=0.11.0
pkgrel=1
pkgdesc="The Lighthouse CI CLI"
arch=(any)
url=https://github.com/GoogleChrome/lighthouse-ci
license=(Apache)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/@lhci/cli/-/cli-$pkgver.tgz)
noextract=(cli-$pkgver.tgz)
sha256sums=('9a54be58586b67fec4c6d05bbd58389e6d56c96ddd973939ceedf1fab3fd2813')

package() {
  npm install --global \
    --cache "$srcdir/.npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/cli-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: set ts=2 sw=2 et:
