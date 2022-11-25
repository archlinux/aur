# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=nodejs-vls
_pkgname=vls
pkgver=0.8.2
pkgrel=1
pkgdesc='Vue language server (LSP)'
arch=('any')
url='https://www.npmjs.com/package/vls'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('7c9c87cceccb2484a3bdaaf420ef8656e4c985a7b34dbcc833ded488238da866')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
