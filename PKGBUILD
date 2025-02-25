# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=husky
pkgver=9.1.7
pkgrel=1
pkgdesc='Git hooks made easy 🐶 woof!'
arch=('any')
url="https://github.com/typicode/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-husky')
replaces=('nodejs-husky')
source=("${pkgname}-${pkgver}.tgz::https://github.com/typicode/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('8116c0e8f3cbdb38c0be801c259f2088a8ee9cb081f15d9cd0dab590c45de12f')

package() {
  # Copied from nodejs-nativefier
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Fixing permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # Don't give ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "$pkgdir/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
