# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=taskline-js
_npmname=@perryrh0dan/taskline
pkgver=1.6.0
pkgrel=1
pkgdesc="Tasks, boards and notes for the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/perryrh0dan/taskline"
license=('MIT')
depends=('libx11' 'nodejs')
makedepends=('npm')
conflicts=('taskline')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/taskline-${pkgver}.tgz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/perryrh0dan/taskline/v${pkgver}/license.md")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('b27122b0578c6890342ec3742ef14f89aca4315853282f982c1b6dad6b6faba2'
            '0bebeb783df72dceaf30c1f930f6b6225b50f16af68f1d09930f82880db0c20f')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  find "${pkgdir}/usr/lib/node_modules" -type d \( -path "*/prebuilds/android-*" -o -path "*/prebuilds/darwin-*" -o -path "*/prebuilds/win32-*" -o -path "*/prebuilds/*ia32*" \) -prune -exec rm -rf {} +
  mv "${pkgdir}/usr/bin/tl" "${pkgdir}/usr/bin/taskline"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
