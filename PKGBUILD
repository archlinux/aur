# Maintainer: pvdp <pvdp@email.com>
# Contributor: hcra <hcra at u53r dot space>
# Contributor: Pico Paco Nano <founderofjp@gmail.com>
# Contributor: felix.s <felix.von.s@posteo.de>

pkgname=weborf
pkgver=1.2
pkgrel=1
pkgdesc="Shares files using the HTTP protocol. Provides CLI. Allows using webdav."
arch=('any')
url="https://codeberg.org/ltworf"
license=('GPL3')
depends=('openssl' 'file')
optdepends=('qweborf: graphical user interface')
conflicts=('weborf-git')
source=(https://codeberg.org/ltworf/weborf/releases/download/$pkgver/weborf_$pkgver.orig.tar.gz)
sha256sums=('eff00f5e0846f13a540a014b6e97ed4e6abcfd4e255a3f3dc7151832c7c50902')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	cp -r "examples" "$pkgdir/usr/share/doc/$pkgname/"
}
