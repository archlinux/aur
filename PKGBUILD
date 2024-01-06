# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgname=nwjs-sdk-bin
pkgver=0.83.0
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
sha512sums=('668bdfe7d68a302699c333a5b655534226cdd6094466e244a8aea3c04f32415bdd6d8488507dd8a3fa09f8ca960cb16a750d9fd1bd5f7ee6e6a5c1697ab4a4d0')

package() {
  cd "${pkgname%-bin}-v${pkgver}-linux-x64"

  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -dr * "${pkgdir}/opt/${pkgname%-bin}/"
  chmod -R 644 "${pkgdir}/opt/${pkgname%-bin}/"
  chmod 755 "${pkgdir}/opt/${pkgname%-bin}/"{,swiftshader,lib,locales,nw,chrome_crashpad_handler}

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-bin}/nw" "${pkgdir}/usr/bin/nw-sdk"
}
