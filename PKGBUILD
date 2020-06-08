# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Patrick Schratz <patrick.schratz@gmail.com>

pkgname=nodejs-decktape
_npmname=decktape
pkgver=3.0.0
pkgrel=1
pkgdesc='PDF exporter for HTML presentation frameworks'
arch=('any')
url='https://github.com/astefanutti/decktape'
license=('MIT')
depends=('npm' 'nodejs')
source=("${_npmname}-${pkgver}.tar.gz::https://github.com/astefanutti/"${_npmname}"/archive/v"${pkgver}".tar.gz")
sha256sums=('690e931e1d5f8aa71dacde43a41b250ed936f9fb9a5b827abac5abe00ebc3841')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  find "$pkgdir/usr/bin" -type d -exec chmod 755 '{}' +
  find "$pkgdir/usr/lib/node_modules" -type d -exec chmod -R 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
