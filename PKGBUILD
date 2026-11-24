# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vercel-serve
_npmname=serve
pkgver=14.2.8
pkgrel=1
pkgdesc="Static file serving and directory listing"
arch=('any')
url="https://github.com/vercel/serve"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('serve-bin')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/serve-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('0f2ae6020310e02a88a96d7a3593524c3cd36f90fbfa0887732a716041cc771d')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
