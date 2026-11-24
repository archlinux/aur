# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=loadtest
_npmname=loadtest
pkgver=8.2.1
pkgrel=1
pkgdesc="Run load tests against a URL"
arch=('x86_64' 'aarch64')
url="https://github.com/alexfernandez/loadtest"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/loadtest-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('7830574a544349f0ffd77a94481aa0591bec3777905708f5d4f4114a6f72aff8')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
