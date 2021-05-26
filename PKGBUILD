# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=autogit
pkgver=1.2.7
pkgrel=1
pkgdesc="Define commands, using plugins, to execute across all your repositories."
arch=(any)
url="https://github.com/fabiospampinato/autogit#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('e2e9c128b67b96cb16640e621d0f8a62fb1888abaf853dc06fa77c07f12dbf8c')
