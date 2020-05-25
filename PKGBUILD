_npmname=renovate
_npmver=20.3.1
pkgname=nodejs-renovate
pkgver=${_npmver}
pkgrel=1
pkgdesc="Automated dependency updates. Multi-platform and multi-language."
arch=(any)
url="https://www.npmjs.com/package/renovate"
license=()
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('5458ee9e0c0c61fb1c7adc7e99be316867c46c7b0dec77d9d612e69101104c98')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$_npmver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user 
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
