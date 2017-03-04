# Maintainer: Sonny Piers <sonny@fastmail.net>

_pkgname=xmpp-console
pkgname="$_pkgname-git"
pkgver=r2132.bb925ff
pkgrel=1
pkgdesc='XMPP terminal and Web console'
arch=('any')
url='https://github.com/node-xmpp/node-xmpp/tree/master/packages/console'
license=('ISC')
depends=('nodejs')
makedepends=('git' 'npm' 'yarn')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname"::'git+https://github.com/node-xmpp/node-xmpp')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
  cd packages/console/
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}/packages/"* "${pkgdir}/usr/lib/${_pkgname}/"
  ln -s "/usr/lib/${_pkgname}/console/app.js" "${pkgdir}/usr/bin/${_pkgname}"
}
