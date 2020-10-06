# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-redbird
pkgver=0.10.0
pkgrel=1
pkgdesc="A modern reverse proxy for node"
arch=("x86_64")
url="https://github.com/OptimalBits/${pkgname#nodejs-}"
license=("BSD")
depends=("nodejs")
makedepends=("npm" "python2")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("3027a6fcef7afebeaa8e5388bef283a84d308518")

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
