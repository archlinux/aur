# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgname=nwjs-sdk-bin
pkgver=0.79.1
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js. SDK release with DevTools"
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("gtk3" "nss" "libxss")
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
provides=("nwjs-sdk")
conflicts=("nwjs-sdk")
source=("${pkgname}-${pkgver}.tar.gz::http://dl.nwjs.io/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz")
sha512sums=('b8d16a708d22638964e94262f0e5c5fb5167d0524fa99fd8956432c34a06490f1c3d8fbfa77bd9a45f443d9e8396dcddb9e0b79225118244d74c7950f9feb975')

package() {
  cd "${pkgname%-bin}-v${pkgver}-linux-x64"

  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -dr * "${pkgdir}/opt/${pkgname%-bin}/"
  chmod -R 644 "${pkgdir}/opt/${pkgname%-bin}/"
  chmod 755 "${pkgdir}/opt/${pkgname%-bin}/"{,swiftshader,lib,locales,nw,chrome_crashpad_handler,nacl_helper}

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-bin}/nw" "${pkgdir}/usr/bin/nw-sdk"
}
