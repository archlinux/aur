_npmname=renovate
_npmver=19.133.11
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
sha256sums=('757e9fb7da33929173936d7699d28d65e83462539f20d79b9c81a2252ca133df')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$_npmver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user 
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
