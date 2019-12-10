# Maintainer: Joaquim Monteiro <joaquim.monteiro at protonmail dot com>
pkgname=sigen
pkgver=1.1.0
pkgrel=1
pkgdesc="Tool that generates standalone EFI executables from Linux kernel images"
arch=(x86_64 i686)
url="https://github.com/gmes78/sigen"
license=('GPL')

depends=('binutils' 'systemd')
makedepends=('rust')
optdepends=('sbsigntools: signing support')

source=("https://github.com/gmes78/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4f5c57b83fa63b3eb4caa120f1087c2586fa6595955d1c1c4219c5d2e8fe5054881706ee46473fa0fc5c6610abbb3941e1c3edbff233d68f467af230a167b1eb')

build() {
	cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

