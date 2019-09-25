# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=qvault
pkgver=0.2.9
pkgrel=2
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
sha256sums=('ddf3bf60153d8540e0863e51471d87b85591d2650655e45b568d42109dab35b7'
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
