_npmname=renovate
_npmver=19.129.0
pkgname=nodejs-renovate
pkgver=19.129.0
pkgrel=1
pkgdesc="Automated dependency updates. Multi-platform and multi-language."
arch=(any)
url="https://www.npmjs.com/package/renovate"
license=()
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('91c9b8c0d419e435ca8b092344cc7d85a182b5a5a593de20470b2cfc80a2e4b3')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$_npmver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user 
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
