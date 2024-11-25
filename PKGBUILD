# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.12.0
pkgrel=0
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/${pkgname#nodejs-}"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "nss")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=('34902a4ba501590ef9c424402ad041d3da95c374')

package() {
  cd "${srcdir}"

  echo "Installing using npm..."
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"

  echo "Installing license file in /usr/share/licenses/${pkgname} ..."
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  echo "Changing permissions to remove the world writable bit set"
  chmod go-w -R "${pkgdir}"
}
