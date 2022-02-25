# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Tim Buecher <timbuecher.dev@gmail.com>

pkgname=geany-astyle
pkgver=0.2.1
pkgrel=5
pkgdesc='Sourcecode formatter/beautifier based on AStyle for Geany'
url='https://launchpad.net/geany-astyle'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('geany' 'astyle')
source=("https://launchpad.net/$pkgname/trunk/0.2.1/+download/astyle-plugin-src-$pkgver.zip")
md5sums=('d3ef9979426d217a3c6becb5ecad4422')

build() {
  cd "astyle-plugin-src-$pkgver/src"

  gcc main.c -O2 -fPIC `pkg-config --cflags geany` -lastyle -shared `pkg-config --libs geany` -o "astyle_plugin.so"
}

package() {
  cd "astyle-plugin-src-$pkgver"

  install -Dm644 readme.txt "$pkgdir/usr/share/doc/geany/README.txt"
  install -Dm755 src/astyle_plugin.so -t "$pkgdir/usr/lib/geany"
}
