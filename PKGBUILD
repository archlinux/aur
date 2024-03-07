
# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: Jonathan Neidel <aur@jneidel.com>

pkgname=nodejs-husky
pkgver="9.0.1"
pkgrel=1
pkgdesc="Git hooks made easy 🐶 woof!"
arch=(any)
url="https://github.com/typicode/husky"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("${pkgname}-${pkgver}.tgz::https://github.com/typicode/husky/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=("b364fcb2be9cc4731e25ad0299270f02f97530ba902a0ed16661958892ebda40e050bccd76b31c3722023f9fc42f1cb10f7b55155ace4c7836cf9d285004a6ee")

package() {
  # copied from: nodejs-nativefier
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Fixing permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "$pkgdir/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

