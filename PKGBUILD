# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=yarn-nightly
_pkgver=$(curl -s -L https://nightly.yarnpkg.com/latest.json | jq -r '.tar.version')
_pkgname="yarn-v$_pkgver"
pkgver=1.23.0.20200615.1917
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management (Bleeding Edge)'
arch=(any)
url='https://yarnpkg.com/en/docs/nightly'
license=('BSD')
depends=('nodejs')
makedepends=('jq' 'curl')
provides=('yarn')
conflicts=('yarn')
source=(https://nightly.yarnpkg.com/yarn-v$_pkgver.tar.gz{,.asc})
md5sums=('7330f70b365d538aee7d86df05649f55'
         'SKIP')
validpgpkeys=(# Yarn Packaging <yarn@dan.cx>
              # https://pgp.mit.edu/pks/lookup?op=get&search=0x1646B01B86E50310
              72ECF46A56B4AD39C907BBB71646B01B86E50310)

pkgver() {
  printf "$_pkgver" | sed 's/-/./g'
}

package() {
  cd $_pkgname
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R * "$pkgdir"/usr/lib/node_modules/yarn

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarn
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarnpkg

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

}
