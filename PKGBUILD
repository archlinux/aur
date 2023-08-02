# Maintainer: Joaquim Monteiro <joaquim.monteiro at protonmail dot com>
pkgname=sigen
pkgver=1.1.3
pkgrel=1
pkgdesc="Tool that generates standalone EFI executables from Linux kernel images"
arch=(x86_64 i686)
url="https://github.com/gmes78/sigen"
license=('GPL')
install=sigen.install

depends=('binutils' 'systemd')
makedepends=('rust')
optdepends=('sbsigntools: signing support')

source=("sigen-${pkgver}.tar.gz"::"https://github.com/gmes78/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('325aacaf66b17b8feec307eef7f4cf14b554a8a0cd9366dd1dd728c727ebf87b6e1b7c66afc97906d87929dd3e95f7462da8fcafca0b7b0958dccabcda7a6ff8')

build() {
	cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

