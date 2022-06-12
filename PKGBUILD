# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>
pkgname="lqsd"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly"
pkgver=0.1.1
pkgrel=2
arch=('x86_64')
url="https://github.com/FunctionalHacker/lqsd"
license=('MIT')
depends=('light')
makedepends=('rust' 'cargo' 'asciidoctor')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ReekyMarko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d1703e70a710d1f9363fe4a55830a4ad65897a803c2f50d9effea7263b53c6d0')

build(){
	cd "$pkgname-$pkgver"
	cargo build --release --locked
	asciidoctor -b manpage manpage.adoc -o ${pkgname}.1
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}"
	install -Dm644 ${pkgname}.1 "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
