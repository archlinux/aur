# Maintainer: Sonny Piers <sonny@fastmail.net>

_pkgname=xmpp-console
pkgname="$_pkgname-git"
pkgver=r2127.3375777
pkgrel=1
pkgdesc='XMPP console'
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

package() {
  cd "$_pkgname"
  yarn
  cd packages/console/
  make
  npm install --user root -g --prefix="$pkgdir/usr"
}
