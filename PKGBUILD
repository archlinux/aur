# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=waha-tui
_npmname=@muhammedaksam/waha-tui
pkgver=1.7.5
pkgrel=1
pkgdesc="Terminal UI for WhatsApp through a WAHA server"
arch=('x86_64' 'aarch64')
url="https://github.com/muhammedaksam/waha-tui"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/waha-tui-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('34edea7c5b2c9fcf6cf70b3d9d7c6cda587c03ba18c90697c5509cb31d8ccffc')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
