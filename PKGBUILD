# Maintainer: X0rg
# Contributor: marlock <marlock87@hotmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=psensor
pkgver=1.1.3
pkgrel=4
pkgdesc="A graphical hardware temperature monitor for Linux"
arch=('i686' 'x86_64')
url="http://wpitchoune.net/psensor"
license=('GPL2')
depends=('lm_sensors' 'dconf' 'gtk3>=3.4' 'udisks2')
makedepends=('help2man')
optdepends=('asciidoc: required to produce the HTML version of the FAQ'
	'libnotify: support for notifications on desktop'
	'libappindicator3: allow Psensor to export a menu into the Unity Menu bar'
	'libxnvctrl: NVIDIA X Ctrl library'
	'json-c: required for remote monitoring'
	'curl: required for remote monitoring'
	'libgtop: required for CPU usage')
conflicts=('libappindicator-gtk2' 'libappindicator-activate-gtk2' 'libappindicator-gtk2-ubuntu' 'lib32-libappindicator-gtk2')
install=$pkgname.install
source=("http://wpitchoune.net/$pkgname/files/$pkgname-$pkgver.tar.gz"
	"psensor-libmicrohttpd.patch")
md5sums=('c3a3c1dea4dbfe12bbfb8088b86c3d4f'
         '6d0414028c191c9c88f42dc765f3ecfd')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/psensor-libmicrohttpd.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
