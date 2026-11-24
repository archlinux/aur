# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tuiboard
_npmname=tuiboard
pkgver=0.16.0
pkgrel=1
pkgdesc="Kanban board in the terminal on plain Markdown files"
arch=('x86_64' 'aarch64')
url="https://github.com/nazzarenogiannelli/tuiboard"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/tuiboard-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('18fb11180032b75cf146659314a8b652ea586410fd81455a1b597860d16e6262')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
