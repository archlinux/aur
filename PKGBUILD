# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pixelmatch
pkgver=7.2.0
pkgrel=1
pkgdesc="The smallest and fastest pixel-level image comparison library"
arch=('any')
url="https://github.com/mapbox/pixelmatch"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE::https://raw.githubusercontent.com/mapbox/pixelmatch/v$pkgver/LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha1sums=('59f4e6faca733f763756d175e2579ed71369fd72'
          'd2a857dabbb49f6c578788cbe6f44940eb2f540b')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
