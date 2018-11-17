# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-redbird
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern reverse proxy for node"
arch=("x86_64")
url="https://github.com/OptimalBits/${pkgname#nodejs-}"
license=("BSD")
depends=("nodejs")
makedepends=("npm" "python2")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("8ce76bee700c6c3c4a4329ae8c296430d3ac4e95")

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
