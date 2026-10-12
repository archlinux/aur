# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jev-axi
pkgver=0.7.2
pkgrel=1
pkgdesc="Agent-ergonomic CLI for TypeSafe's Jev: calibrated judgments (pick, rate, check, rank, triage, guard) from the shell"
arch=('any')
url="https://github.com/shiftynick/jev-axi"
license=('MIT')
depends=('nodejs>=22')
makedepends=('npm')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('d08d8328500e5e0d3360abb8211224e71f605bbde0c7c6e367d03d224014454b')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # npm can create directories with nondeterministic permissions.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
