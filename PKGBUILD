# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_npmname=ungit
_npmver=1.5.7
pkgname=nodejs-ungit
pkgver=1.5.7
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
sha512sums=('11001e31702e5996293ac49948472ac6a29284b7065ae093544c5c77228dbf09b0d8647c23fa8a83a97c75010d7980780c2fb0cf12894d7d39e22ba7f91aefa9')

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
