# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=nodemcu-tool
_npmver=3.0.0
_commit=257861b90cad8c9d5baf01d4b8d581b151aafb5a
pkgname=$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Upload/Download Lua files to your ESP8266 module with NodeMCU firmware"
arch=(any)
url="https://www.npmjs.com/package/nodemcu-tool"
license=('MIT')
depends=('nodejs>=8')
#source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
source=(https://github.com/AndiDittrich/NodeMCU-Tool/archive/$_commit.tar.gz)
sha256sums=('6dc545ebfe036e81c85f5e4bd897103a4dbc9ce4ecbab5c00955412f0dbfaf9a')

package() {
  cd "$srcdir/NodeMCU-Tool-$_commit"
  /usr/bin/npm install
  chmod go-w . -R
  mkdir -p "$pkgdir/usr/share"
  cp -a . "$pkgdir/usr/share/nodemcu-tool"
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/nodemcu-tool/bin/nodemcu-tool.js "$pkgdir/usr/bin/nodemcu-tool"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
