# Maintainer: Joaquim Monteiro <joaquim.monteiro at protonmail dot com>
pkgname=sigen
pkgver=1.1.1
pkgrel=1
pkgdesc="Tool that generates standalone EFI executables from Linux kernel images"
arch=(x86_64 i686)
url="https://github.com/gmes78/sigen"
license=('GPL')

depends=('binutils' 'systemd')
makedepends=('rust')
optdepends=('sbsigntools: signing support')

source=("sigen-${pkgver}.tar.gz"::"https://github.com/gmes78/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0f0fe3f5ef79c982118f80435ed2e0831520a55b36a3be55f0059b5373297b98e71428e5c603c85249ccd734484c3281c0a8dd22c3cbf534c9944f1d9598e346')

build() {
	cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

