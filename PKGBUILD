# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=qvault
pkgver=0.2.10
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
sha256sums=('2d56dc5920e378c00dfe0d34a4c7df59e99ce05ef6616aca9470dcec70d94827'
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
