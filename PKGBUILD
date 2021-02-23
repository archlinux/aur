# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=quicktype
pkgver=15.0.260
pkgrel=1
pkgdesc="Generate types and converters from JSON, Schema, and GraphQL"
arch=(any)
url="https://github.com/quicktype/quicktype"
license=(Apache)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
options=(!strip)

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

sha256sums=('57ffeb7f12f3c3476bd7e0213716006b49a8159c20e63fd60cb07eefa4289b6f')
