# Contributor: icasdri <icasdri at gmail dot com>

_npmname=swagger-dsl
pkgname=swagger-dsl
pkgver=0.2.2
pkgrel=2
pkgdesc="CoffeeScript-based domain-specific language for generating JSON documents for Swagger"
arch=(any)
url="https://github.com/intellinote/swagger-dsl"
license=('MIT')
depends=('nodejs' 'coffeescript')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('cdd342a9a055bed795691f9ce5190538cb57f1b5d0edfd7ed4556d776e86e905848a4939ff84afdb4e88ad04dc2abf3264e393f95a4eeffffb68ee048543e554')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
