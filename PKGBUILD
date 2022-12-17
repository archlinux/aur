# Maintainer: Atom Long <atom0815@gmail.com>

pkgname=electron-builder
pkgver=23.6.0
pkgrel=1
pkgdesc="A complete solution to package and build a ready for distribution Electron app with “auto update” support out of the box"
arch=(any)
url="https://www.electron.build/"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("${pkgname}-${pkgver}.tgz::http://registry.npmjs.org/${pkgname}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=("1740bec188d25af49dc5cda3828105fd6bd84f075e4dd1d3eb74c1ef6e4280a0")

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
