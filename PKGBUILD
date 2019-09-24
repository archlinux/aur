# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=qvault
pkgver=0.2.7
pkgrel=1
epoch=
pkgdesc="An open source, fully transparent and extremely secure password manager"
arch=('any')
url="https://qvault.io"
options=('!strip')
license=('MIT')
depends=('yarn' 'npm')
source=("https://github.com/Q-Vault/qvault/archive/v${pkgver}.tar.gz"
	'qvault.desktop'
	)
sha256sums=('6a9ebe5a83a6890df62bbd3375ccb357d245072b6cf0ffb36d29337032521ec7' 'SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	yarn install
}

build() {
	cd "$pkgname-$pkgver"
	yarn release --publish never
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/applications}
	cd "$pkgname-$pkgver"

	mv build/{icon,qvault}.png
	mv release/{QVault-$pkgver.AppImage,qvault}

	install -m755 "$srcdir/$pkgname-$pkgver/release/qvault" $pkgdir/usr/bin
	install -m644 "$srcdir/qvault.desktop" $pkgdir/usr/share/applications
	install -m644 "$srcdir/$pkgname-$pkgver/build/qvault.png" $pkgdir/usr/share/applications
}
