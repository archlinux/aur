# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Demir Yerli <mrquantumoff@protonmail.com>
pkgname=qfetch
pkgver=0.9.1
pkgrel=2
pkgdesc="A simple fetch tool written in rust"
arch=('x86_64')
url="https://bultek.synchron.com.ua/bultekdev/software/qfetch"
license=('BSD-2-Clause')
makedepends=("rust")
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
#source=("https://bultek.synchron.com.ua/bultekdev/software/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('9422316216157417ee9cb89dfe8ba6cb6cc2f05004af3d674756f2b5b7d6db04')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo clean
}

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "target/release"
	install -Dm755 -t "${pkgdir}/usr/bin/" qfetch
}
