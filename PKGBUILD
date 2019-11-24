# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=broken-link-checker
pkgver=0.7.8
pkgrel=1
pkgdesc="Find broken links, missing images, etc within your HTML"
arch=(any)
url="https://github.com/stevenvachon/broken-link-checker"
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

sha256sums=('33367d4c0ebd4495144d38cbcf12d844786295218d463c7d1dd315709193e3e8')
