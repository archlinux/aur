pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.11.2
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=(package.json.patch "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('084d309c17422e493045a553aae7378f6a28c50c9745e83accac92f62c553412'
            '539c37475a38f0a83f20d918c243c327f63906d1ac8849a0a1a93d1a0c5b54e9')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  tar -xf "$srcdir"/"$_pkgname-$pkgver.tgz" -C "$srcdir"
  patch -p0 -d "$srcdir" < "$srcdir/../package.json.patch"
  rm -rf "$srcdir"/"$_pkgname-$pkgver.tgz"
  tar -czf "$_pkgname-$pkgver.tgz" -C "$srcdir" package
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
