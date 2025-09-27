# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=1.2.2
pkgrel=2
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('MIT')
makedepends=('gnutls')
source=("https://github.com/dotse/bbk/archive/refs/tags/BBK_CLI_${pkgver}.tar.gz" "https://frontend.bredbandskollen.se/download/README.txt")
sha256sums=('53fb3a50622d1661e38c96ba61fa906d21050f9e508380b605920bde1f955e6b'
            '525254138b2dd44c810d5d31b1846dd2395eb6353c5f32805079da60a2f36ada')

prepare() {

	sed -i '/#include <limits>/a#include <cstdint>' "$srcdir/bbk-BBK_CLI_${pkgver}/src/json11/json11.cpp"
											
}


build() {

	cd "$srcdir/bbk-BBK_CLI_${pkgver}/src/cli"
	make clean
	make GNUTLS=1
}

package() {

	install -Dm755 "$srcdir/bbk-BBK_CLI_${pkgver}/src/cli/cli" "$pkgdir/usr/bin/bbk_cli"	
	install -Dm644 "$srcdir/bbk-BBK_CLI_${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
