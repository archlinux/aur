# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vibe-log-cli
_npmname=vibe-log-cli
pkgver=0.8.14
pkgrel=1
pkgdesc="Log and analyze Claude Code and Cursor sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/vibe-log/vibe-log-cli"
license=('MIT')
depends=('libcap' 'libx11' 'nodejs' 'openssl-3')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/vibe-log-cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('9ff3c3378e020c884529d206c68e2b6a78eae5400b85dbfef7b0858e61911758')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
