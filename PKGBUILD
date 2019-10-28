# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=qvault
pkgver=0.2.12
pkgrel=1
pkgdesc="An open source, fully transparent and extremely secure password manager"
arch=('any')
url="https://qvault.io"
license=('MIT')
depends=('electron')
makedepends=('yarn' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Q-Vault/qvault/archive/v${pkgver}.tar.gz"
	'qvault.desktop'
	'qvault'
	)
sha256sums=('335c4aec122a489c19cf5dceca60fda64429a95475ab5eea276eb655aec2159f'
	'SKIP'
	'SKIP')

build() {
	cd "$pkgname-$pkgver"
	chmod u+x scripts/archLinuxRelease.sh
	yarn release-arch-linux
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/licenses"
	cd "$pkgname-$pkgver"

	mv build/{icon,qvault}.png
	mv release/linux-unpacked/resources/{app,qvault}.asar

	install -m755 "$srcdir/qvault" "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m644 "$srcdir/$pkgname-$pkgver/build/qvault.png" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/qvault.desktop" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname-$pkgver/release/linux-unpacked/resources/qvault.asar" "$pkgdir/usr/share/"
}
