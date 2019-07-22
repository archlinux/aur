# Maintainer: beest <gnubeest@zoho.com>

pkgname=motsognir
pkgver=1.0.12
pkgrel=2
pkgdesc="A robust, reliable and easy to install gopher server."
arch=(x86_64)
url="http://motsognir.sourceforge.net/"
license=('GPL3')
optdepends=('php: php scripting support')
source=("https://downloads.sourceforge.net/project/$pkgname/v$pkgver/$pkgname-$pkgver.tar.xz" \
        "motsognir.service")
sha256sums=('b9d67df7bde3151d66000a9605cac2f15cca888e7cd174ae384d0835b4c54de5'
            '8b8f6257f8da3bb9ce9ecd452536f05809e66abd82154fc18a45e6807c702306')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "motsognir" \
		"${pkgdir}/usr/bin/motsognir"
	install -Dm644 "motsognir.8.gz" \
		"${pkgdir}/usr/share/man/man8/motsognir.8.gz"
	install -Dm644 "manual.pdf" \
		"${pkgdir}/usr/share/doc/motsognir/manual.pdf"
	install -Dm644 "motsognir.conf" \
		"${pkgdir}/usr/share/doc/motsognir/motsognir.conf"
	install -Dm644 "motsognir-extmap.conf" \
		"${pkgdir}/usr/share/doc/motsognir/motsognir-extmap.conf"
	install -Dm644 ../motsognir.service \
		"${pkgdir}/usr/lib/systemd/system/motsognir.service"
}
