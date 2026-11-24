# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=optimizt
_npmname=@343dev/optimizt
pkgver=13.0.0
pkgrel=1
pkgdesc="CLI image optimization tool"
arch=('x86_64' 'aarch64')
url="https://github.com/343dev/optimizt"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/optimizt-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('6880d0574fa58a7601253771db919e624a68825d74714633e97fea9a36faf28d')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
