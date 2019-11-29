# Maintainer: Marco Pompili <aur (at) mg.odd.red>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_npmname=ungit
_npmver=1.5.0
pkgname=nodejs-ungit
pkgver=1.5.0
pkgrel=1
pkgdesc="Git made easy"
arch=('i686' 'x86_64')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/ungit"
license=('MIT')
provides=('nodejs-ungit' 'ungit')
conflicts=('ungit')
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/ungit/-/ungit-${pkgver}.tgz")
sha512sums=('ff3d53ecf45cd9cdc09572b52100b3a59d5fb74ecc2f18bf5a666504176a662555f697f7b4e6bbb9620bb3d6c76875009563318b1d45d1901308da9bdfc7b574')

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}

  msg2 'Renaming binary from 0ungit-credentials-helper to ungit-credentials-helper'
  mv "${pkgdir}/usr/bin/0ungit-credentials-helper" "${pkgdir}/usr/bin/ungit-credentials-helper"

  # fixing perms
  chmod 755 ${pkgdir}/usr/bin/
  chmod -R 755 ${pkgdir}/usr/lib/node_modules/
}
