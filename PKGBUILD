# Maintainer Chris Werner Rau <aur@cwrau.io>
# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.12.0 # renovate: datasource=npm depName=terminalizer
pkgrel=2
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/${pkgname#nodejs-}"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "nss")
makedepends=("npm" "python")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha512sums=('7838be7b315eb5a83fffbff463a0bf5e5c553c18cc90cde9bd852bd6057a089cbc844c76be3356aae6e2c3cee9b1dacc9d748e4c3b610d64afa40ac40ae33d70')

package() {
  cd "${srcdir}"

  echo "Installing using npm..."
  CXXFLAGS="--std=c++20" npm install --omit=dev -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  echo "Installing license file in /usr/share/licenses/${pkgname} ..."
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  echo "Changing permissions to remove the world writable bit set"
  chmod go-w -R "${pkgdir}"
}
