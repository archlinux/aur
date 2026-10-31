# Maintainer: David Rosenstrauch <darose@darose.net>
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: xsmile <sascha_r gmx de>

pkgname=ta-lib
_projectname=TA-Lib
pkgver=0.8.3
pkgrel=1
pkgdesc="A library providing common functions for the technical analysis of financial market data"
arch=('x86_64')
url="https://github.com/TA-Lib/ta-lib"
license=('BSD-3-Clause')
depends=('glibc')
source=(
    "https://github.com/$_projectname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz"
    "https://raw.githubusercontent.com/$_projectname/$pkgname/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
    '28b1179b178a0db15f3dad0d846ef77f18eb06db5dfc5b5a8ca153a9ea5d84e6'
    '13f42bb183695b0c9b2e7c7282c1b0f5ac83c990bef37515df0639667f72a327'
)

build() {
	cd "$pkgname-$pkgver"
        # autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
        install -Dm644 "../LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
