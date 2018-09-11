# Maintainer: Marcs <aur (at) mg.odd.red>

_npmname=lerna
_npmver=3.3.0
pkgname=lerna
pkgver=3.3.0
pkgrel=1
pkgdesc="Tool for managing JavaScript projects with multiple packages"
arch=(any)
url="https://github.com/sebmck/lerna#readme"
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_npmname}/${_npmname}/archive/v${_npmver}.tar.gz")
sha256sums=('fef6fc20b05d7a02a2cbdf2cb764f3560fa58b0d5f49a9270fbd4e0bd33f8922')
noextract=(${_npmname}-${_npmver}.tgz)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}

  # fix perms
  chmod 755 ${pkgdir}/usr/bin
  find ${pkgdir}/usr/lib/node_modules/ -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
