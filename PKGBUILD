# Maintainer: Fabio Lenherr <dashie@dashie.org>

pkgname=oxicalc
pkgver="0.2.2"
pkgrel=1
srcdir=OxiCalc-${pkgver}
arch=('x86_64')
pkgdir="/usr/bin/${pkgname}"
url="https://github.com/DashieTM/OxiCalc"
pkgdesc="A small and simple calculator written with rust and gtk4"
depends=('gtk4')
makedepends=('rust' 'gendesk' 'git')
source=("${pkgver}.tar.gz::https://github.com/DashieTM/OxiCalc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('54559a0ce5933074ebe5f049580b83664769258b4e580da6d95345c2ed2b9d4d')

build() {
  cd OxiCalc-${pkgver}
	cargo build --release
}

package() {
  cd OxiCalc-${pkgver}
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "OxiCalc" --categories "Utility;GTK;" -f
	install -Dm755 target/release/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
	install -Dm644 "$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
