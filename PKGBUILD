# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Yufan You <ouuansteve at gmail>

_base=carbon-now-cli
pkgname=${_base}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Beautiful images of your code — from right inside your terminal"
provides=(${_base})
conflicts=(${_base})
arch=(any)
url="https://github.com/mixn/${_base}"
license=(MIT)
# depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/${_base}/-/${_base}-${pkgver}.tgz)
sha512sums=('9da776c1a187aede0848a5375403dd7fe73279774f455b8d989490b4b0f829235c3f0477c2aa600a8ed8e0f05961d614f84d08452692e5ad507c8536e489eac7')
noextract=("${_base}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_base-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_base/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
