# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Adapted from nodejs-mkdirp

pkgname=nodejs-decktape
_npmname=decktape
pkgver=2.10.0
pkgrel=3
pkgdesc='PDF exporter for HTML presentation frameworks'
arch=('any')
url='https://github.com/astefanutti/decktape'
license=('MIT')
depends=('npm' 'nodejs')
source=("${_npmname}-${pkgver}.tar.gz::https://github.com/astefanutti/"${_npmname}"/archive/v"${pkgver}".tar.gz")

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
md5sums=('155ac0d666f8dea448f56eefc2a0618f')
