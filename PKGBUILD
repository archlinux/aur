# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=nodejs-vls
_pkgname=vls
pkgver=0.7.0
pkgrel=1
pkgdesc='Vue language server (LSP)'
arch=('any')
url='https://github.com/vuejs/vetur/tree/master/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('6b1e2a888a6a32b4679a5f6773ee9c60688156c48c1d36110a57cc50f5699474')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
