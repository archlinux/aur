# Maintainer: Marco Pompili <aur@odd.red>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_npmname=ungit
_npmver=1.5.30
pkgname=nodejs-ungit
pkgver=1.5.30
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
sha512sums=('ca5b03a17884eb80496bbd718cd140553418206a406999d6b0c6700e16719367eae4c2049bef7061953ce3e5468b51aabfe1382bd25c94debd6e79354a85c38d')

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
