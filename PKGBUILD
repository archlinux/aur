# Maintainer: Tim Buecher <timbuecher.dev@gmail.com>
# Contributor: James An <james@jamesan.ca>

pkgname=geany-astyle
pkgver=0.2.1
pkgrel=2
pkgdesc='Sourcecode formatter/beautifier based on AStyle for Geany'
url='https://launchpad.net/geany-astyle'
arch=('i686' 'x86_64')
license='GPL3'
depends=('geany' 'astyle')
makedepends=('unzip')
source=("https://launchpad.net/$pkgname/trunk/0.2.1/+download/astyle-plugin-src-$pkgver.zip")
md5sums=('d3ef9979426d217a3c6becb5ecad4422')
noextract=("astyle-plugin-src-$pkgver.zip")

prepare() {
    unzip -o "astyle-plugin-src-$pkgver.zip"
}

build() {
    cd "astyle-plugin-src-$pkgver/src"

    gcc main.c -O2 -fPIC `pkg-config --cflags geany` -lastyle-2.05.1 -shared `pkg-config --libs geany` -o "astyle_plugin.so"
}

package() {
    cd "astyle-plugin-src-$pkgver"

    install -Dm644 readme.txt "$pkgdir/usr/share/doc/geany/README.txt"
    install -Dm644 src/astyle_plugin.so "$pkgdir/usr/share/geany/astyle_plugin.so"
}
