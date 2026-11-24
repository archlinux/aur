# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sharing
_npmname=easy-sharing
pkgver=1.4.0
pkgrel=1
pkgdesc="Share directories and files to phones over the local network with a QR code"
arch=('x86_64' 'aarch64')
url="https://github.com/parvardegr/sharing"
license=('MIT')
depends=('libx11' 'nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/easy-sharing-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('842337c147d271ac46a976a60b5927e1302d418d375a30680e0ccd81820c7a78')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
