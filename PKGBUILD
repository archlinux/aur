# Maintainer: liolok <aur@liolok.com>
# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=hexo-cli
pkgver=4.3.0
pkgrel=1
pkgdesc="Command line interface for Hexo"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('933c8495faa4393cf9cf2e120e49e33495820605b75738813918a086605ca20d')

package() {
  npm install --global --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown --recursive root:root "${pkgdir}"
}
