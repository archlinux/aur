# Maintainer: Rubin Simons <me@rubin55.org>
# Contributor: Bitals <me at bitals dot xyz>
# Contributor: Jonathan Neidel <aur@jneidel.com>

pkgname=nodejs-husky
pkgver="9.1.7"
pkgrel=1
pkgdesc="Git hooks made easy 🐶 woof!"
arch=(any)
url="https://github.com/typicode/husky"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("${pkgname}-${pkgver}.tgz::https://github.com/typicode/husky/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('0e94d4154eeb0c97f938b496d17f23848b777f39989946295354ac17cf8a21ab45981c05eb85873083cfd88d98ed283b676cd77bd92b46b6464c1585d0e1a8ad')

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

