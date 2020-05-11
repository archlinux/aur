pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.11.0
pkgrel=2
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=(package.json.patch "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('6cbe6cd99fa23cfbf4023958efda5b4e570ad148e7060c65ef392327bbf96961'
            '4f0c9834fc38b68b11ba045ea96a449de20cf026d9de5a8c7259160b708455e4')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  tar -xf "$srcdir"/"$_pkgname-$pkgver.tgz" -C "$srcdir"
  patch -p0 -d "$srcdir" < "$srcdir/package.json.patch"
  rm -rf "$srcdir"/"$_pkgname-$pkgver.tgz"
  tar -czf "$_pkgname-$pkgver.tgz" -C "$srcdir" package
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
