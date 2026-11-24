# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=updates
_npmname=updates
pkgver=20.0.2
pkgrel=1
pkgdesc="Update npm, uv, cargo, go, docker and Actions dependencies"
arch=('any')
url="https://github.com/silverwind/updates"
license=('BSD-2-Clause')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/updates-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('2b54acfa935623499623b5e0f6023f869adbad1013743171581da175f46ec165')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
