# Maintainer: Bruno Inec <brunoinec at gmail dot com>

_npmname=relaxedjs

pkgname=relaxed
pkgver=0.1.11
pkgrel=1
pkgdesc="Create PDF documents using web technologies"
arch=(x86_64)
url="https://github.com/RelaxedJS/ReLaXed"
license=(ISC)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('97a490e324b1c92e0cbcf29a3e7a653bf1f997dbaca74afbaa328189df96bfe3')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
