# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-paperclipai
pkgver=2026.609.0 # renovate: datasource=npm depName=paperclipai
pkgrel=1
pkgdesc="Paperclip CLI — orchestrate AI agent teams to run a business"
arch=("x86_64")
url="https://github.com/paperclipai/paperclip"
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "nodejs-addon-api")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha512sums=('904f23102d7222e37059f8e5da5b896c10b01fa75ba8654e6705a093dbeacbed310d7108e5175c859e350fc97ca1853bb533f36e952c8eb50a5f8b1ea0a977ab')

package() {
  export NODE_PATH=/usr/lib/node_modules
  npm install --omit=dev -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  chmod go-w -R "${pkgdir}"
}

#vim: syntax=sh
