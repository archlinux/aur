# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pixelmatch
pkgver=8.0.0
pkgrel=2
pkgdesc="The smallest and fastest pixel-level image comparison library"
arch=('any')
url="https://github.com/mapbox/pixelmatch"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/mapbox/pixelmatch/v$pkgver/LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha1sums=('e1aeaa0b6e52b87603e0a6e8ae35687e1550a143'
          'd2a857dabbb49f6c578788cbe6f44940eb2f540b')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
