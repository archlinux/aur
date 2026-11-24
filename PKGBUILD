# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openseek
_npmname=openseek
pkgver=0.0.11
pkgrel=1
pkgdesc="Terminal coding agent with multiple model providers"
arch=('x86_64' 'aarch64')
url="https://github.com/lichamnesia/openseek"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/openseek-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('a080232555872491e22d02d062eb8e0cf68ee26dfe6f400699178bba0e398380')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
