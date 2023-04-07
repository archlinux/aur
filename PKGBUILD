pkgname=nodejs-birthday
_pkgname=${pkgname#nodejs-}
pkgver=1.2.12
pkgrel=1
pkgdesc="Know when a friend's birthday is coming."
arch=(any)
url="https://github.com/IonicaBizau/birthday"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("$_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha1sums=('a3ada4bda3a228d3fc1b5c44da3d061bd557c79c')

prepare() {
  tar -xvzf "$_pkgname-$pkgver.tgz" --directory "${srcdir}" "package/LICENSE"
}

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$_pkgname@$pkgver"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chown -R root:root "$pkgdir"
}
