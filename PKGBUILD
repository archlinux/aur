# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
# This package in inspired from gulp one
pkgname=npm-check-updates
pkgver=2.8.0
pkgrel=1
pkgdesc="Command-line tool that allows to upgrade package.json or bower.json dependencies to the latest versions"
arch=('any')
url="https://github.com/tjunnone/npm-check-updates"
license=('Apache')
depends=('nodejs' 'python')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
md5sums=('87ceebc186489c201afd7d8fea5f4189')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  rm -r "${pkgdir}/usr/etc"
  rm -r "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/npm/man"
  rm -r "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/npm/node_modules/request/node_modules/http-signature/node_modules/sshpk/man"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Fix permissions
  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
}
