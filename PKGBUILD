pkgname=nodejs-stegcloak
_pkgname=${pkgname#nodejs-}
pkgver=1.1.1
pkgrel=1
pkgdesc="Hide secrets with invisible characters in plain text securely using passwords"
arch=(any)
url="https://github.com/KuroLabs/stegcloak"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("$_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha1sums=('7d05a6a0322d6e262e6227845860a138e1c39ef3')

prepare() {
  tar -xvzf "$_pkgname-$pkgver.tgz" --directory "${srcdir}" "package/LICENSE"
}

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$_pkgname@$pkgver"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chown -R root:root "$pkgdir"
}

