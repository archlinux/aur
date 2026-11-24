# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oji
_npmname=oji
pkgver=3.2.3
pkgrel=1
pkgdesc="Text emoticon maker"
arch=('x86_64' 'aarch64')
url="https://github.com/xxczaki/oji"
license=('MIT')
depends=('libx11' 'nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/oji-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('c4f043683fa1cecb75c7c19e0ab7bd57e50924eaa30cfb755beb3ef61acebf54')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
