# Maintainer: David Horvath <horvath.david987 at gmail dot com>
pkgname='mqtt-explorer'
pkgver=0.3.5
pkgrel=4
pkgdesc="A comprehensive and easy-to-use MQTT Client"
arch=('any')
url="https://mqtt-explorer.com/"
license=('CCPL:by-nd')
groups=()
depends=('npm'
         'yarn'
	     'git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("~/.config/MQTT-Explorer/settings.json")
options=(!strip)
install=
changelog=
source=("$pkgname-${pkgver}.tar.gz::https://github.com/thomasnordquist/MQTT-Explorer/archive/v$pkgver.tar.gz"
        "$pkgname-${pkgver}-desktop.tar.gz::https://github.com/dave12311/mqtt-explorer.desktop/archive/1.1.tar.gz")
validpgpkeys=("4AEE18F83AFDEB23")

build() {
	cd "MQTT-Explorer-${pkgver}"
	yarn
	yarn build
}

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r MQTT-Explorer-${pkgver}/* $pkgdir/usr/share/$pkgname/
	mkdir -p "$pkgdir/usr/share/applications"
	cp mqtt-explorer.desktop-1.0/mqtt-explorer.desktop $pkgdir/usr/share/applications/
	mkdir -p "$pkgdir/usr/bin"
	echo "#!/bin/bash" > "$pkgdir/usr/share/$pkgname/$pkgname"
	echo "yarn --cwd /usr/share/mqtt-explorer start" >> "$pkgdir/usr/share/$pkgname/$pkgname"
	chmod 777 "$pkgdir/usr/share/$pkgname/$pkgname"
	ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
md5sums=('66b04e6991416cf8be67c0d8c3706477'
         'd1edbfd617569f74c3cb8e25fca500de')
