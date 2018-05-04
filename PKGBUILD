# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=godaddy-dns
pkgver=1.3.0
pkgrel=2
pkgdesc="A Node.js script to programmatically update GoDaddy DNS records"
arch=(any)
url="https://github.com/lmammino/godaddy-dns#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --production --global --prefix "$pkgdir/usr" $pkgname@$pkgver

  install -Dm644 "$_npmdir/godaddy-dns/LICENSE" --target-directory="$pkgdir/usr/share/licenses/godaddy-dns"

  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
sha256sums=('47423f36bf578227622b004777c4b46ca5cffa9d68f55d86794217f6e583254b')
