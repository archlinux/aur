# Maintainer: Micha Alt <micha.tucker at gmail dot com>

_npmname=storjshare-cli
pkgname=$_npmname
pkgver=3.0.4
pkgrel=1
pkgdesc="Command line interface for farming on the Storj network"
arch=('any')
url="http://storj.io/share.html"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
       'LICENSE')
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c0ebcb322ddd617d87a6140f686a4fca7481259e8112bf060ce65fe9e5137099'
    '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rmdir "${pkgdir}/usr/etc"
}
